<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\DesignTemplate;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

class DesignTemplateController extends Controller
{
    private function categories(): array
    {
        $main = Category::where('parent_id', 0)->select('id', 'name')->orderBy('name')->get();
        $sub  = Category::where('parent_id', '!=', 0)->select('id', 'name', 'parent_id')->orderBy('parent_id')->orderBy('name')->get();
        return [$main, $sub];
    }

    private function products()
    {
        return Product::withoutGlobalScopes()->select('id', 'name')->orderBy('name')->limit(600)->get();
    }

    public function byCategory(Request $request)
    {
        $search     = $request->input('search', '');
        $productId  = $request->input('product_id');
        $categoryId = $request->input('category_id');
        $status     = $request->input('status', '');   // '' | '1' | '0'

        $query = DesignTemplate::with(['mainCategory.parent', 'product'])
            ->orderBy('position')
            ->orderBy('id', 'desc');

        if ($search)     $query->where('name', 'like', "%{$search}%");
        if ($productId)  $query->where('product_id',  $productId);
        if ($categoryId) $query->where('category_id', $categoryId);
        if ($status !== '') $query->where('status', (int) $status);

        $all = $query->get();

        // Group by category: "بدون تصنيف" | "اسم الرئيسي > اسم الفرعي"
        $grouped = $all->groupBy(function ($t) {
            if (!$t->mainCategory) return '__none__';
            if ($t->mainCategory->parent_id == 0) return $t->mainCategory->name;
            return ($t->mainCategory->parent->name ?? '—') . ' › ' . $t->mainCategory->name;
        })->sortKeys();

        // Move "بدون تصنيف" to the end
        if ($grouped->has('__none__')) {
            $none = $grouped->pull('__none__');
            $grouped->put('بدون تصنيف', $none);
        }

        $filterProduct  = $productId ? Product::select('id', 'name')->find($productId) : null;
        $allProducts    = $this->products();
        [$mainCategories] = $this->categories();

        return view('admin-views.design-template.by-category',
            compact('grouped', 'search', 'productId', 'categoryId', 'status', 'filterProduct', 'allProducts', 'mainCategories'));
    }

    public function index(Request $request)
    {
        $search      = $request->input('search', '');
        $perPage     = (int) $request->input('per_page', 20);
        $fromProductId = $request->input('product_id');

        $query = DesignTemplate::with('mainCategory')->orderBy('position')->orderBy('id', 'desc');
        if ($search) {
            $query->where('name', 'like', "%{$search}%");
        }

        $templates = $query->paginate($perPage)->withQueryString();
        [$mainCategories, $subCategories] = $this->categories();

        $products      = $this->products();
        $fromProduct   = $fromProductId ? Product::select('id', 'name')->find($fromProductId) : null;

        return view('admin-views.design-template.index',
            compact('templates', 'search', 'perPage', 'mainCategories', 'subCategories', 'products', 'fromProduct', 'fromProductId'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'name'       => 'required|string|max:255',
            'product_id' => 'required|exists:products,id',
            'canvas_json'=> 'required|string',
        ]);

        $template               = new DesignTemplate();
        $template->name         = $request->name;
        $template->category_id  = $request->input('category_id') ?: null;
        $template->product_id   = $request->input('product_id') ?: null;
        $template->canvas_json  = $request->canvas_json;
        $template->canvas_width = max(100, (int) $request->input('canvas_width', 800));
        $template->canvas_height= max(100, (int) $request->input('canvas_height', 800));
        $template->position     = (int) $request->input('position', 0);
        $template->status       = 1;
        $template->thumbnail    = $this->saveThumbnail($request->input('thumbnail_base64'));
        $template->save();

        Cache::forget(CACHE_DESIGN_TEMPLATES);

        return redirect()->route('admin.design-template.add-new')
            ->with('success', translate('template_added') ?: 'تم إضافة القالب بنجاح');
    }

    public function edit($id)
    {
        $template = DesignTemplate::findOrFail($id);
        [$mainCategories, $subCategories] = $this->categories();

        // Pre-select main category
        $selectedMain = null;
        $selectedSub  = null;
        if ($template->category_id) {
            $cat = Category::find($template->category_id);
            if ($cat) {
                if ($cat->parent_id == 0) {
                    $selectedMain = $cat->id;
                } else {
                    $selectedMain = $cat->parent_id;
                    $selectedSub  = $cat->id;
                }
            }
        }

        $products = $this->products();

        return view('admin-views.design-template.edit',
            compact('template', 'mainCategories', 'subCategories', 'selectedMain', 'selectedSub', 'products'));
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'name'       => 'required|string|max:255',
            'product_id' => 'required|exists:products,id',
            'canvas_json'=> 'required|string',
        ]);

        $template               = DesignTemplate::findOrFail($id);
        $template->name         = $request->name;
        $template->category_id  = $request->input('category_id') ?: null;
        $template->product_id   = $request->input('product_id') ?: null;
        $template->canvas_json  = $request->canvas_json;
        $template->canvas_width = max(100, (int) $request->input('canvas_width', $template->canvas_width));
        $template->canvas_height= max(100, (int) $request->input('canvas_height', $template->canvas_height));
        $template->position     = (int) $request->input('position', $template->position);

        if ($request->filled('thumbnail_base64')) {
            if ($template->thumbnail) {
                Storage::disk('public')->delete('design-templates/' . $template->thumbnail);
            }
            $template->thumbnail = $this->saveThumbnail($request->input('thumbnail_base64'));
        }

        $template->save();
        Cache::forget(CACHE_DESIGN_TEMPLATES);

        return redirect()->route('admin.design-template.edit', $id)
            ->with('success', translate('template_updated') ?: 'تم تحديث القالب بنجاح');
    }

    public function status($id, $status)
    {
        $template = DesignTemplate::findOrFail($id);
        $template->update(['status' => (int) $status]);
        Cache::forget(CACHE_DESIGN_TEMPLATES);
        return response()->json(['success' => true]);
    }

    public function delete($id)
    {
        $template = DesignTemplate::findOrFail($id);
        if ($template->thumbnail) {
            Storage::disk('public')->delete('design-templates/' . $template->thumbnail);
        }
        $template->delete();
        Cache::forget(CACHE_DESIGN_TEMPLATES);

        return redirect()->route('admin.design-template.add-new')
            ->with('success', translate('template_deleted') ?: 'تم حذف القالب');
    }

    private function saveThumbnail(?string $base64): ?string
    {
        if (!$base64 || !str_starts_with($base64, 'data:image')) {
            return null;
        }
        $data = base64_decode(preg_replace('#^data:image/\w+;base64,#i', '', $base64));
        if (!$data || strlen($data) > 3 * 1024 * 1024) {
            return null;
        }
        $filename = Str::uuid() . '.png';
        Storage::disk('public')->makeDirectory('design-templates');
        Storage::disk('public')->put('design-templates/' . $filename, $data);
        return $filename;
    }
}
