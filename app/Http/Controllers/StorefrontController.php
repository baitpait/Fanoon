<?php

namespace App\Http\Controllers;

<<<<<<< HEAD
use Illuminate\Http\Request;

class StorefrontController extends Controller
{
    public function home()
    {
        return view('storefront.home');
    }

    public function products(Request $request)
    {
        return view('storefront.products');
    }

    public function product($id)
    {
        return view('storefront.product', ['productId' => $id]);
    }

    public function contact()
    {
        return view('storefront.contact');
    }

    public function offers()
    {
        // عروض = منتجات مخفّضة + فلاش سيل
        return view('storefront.offers');
    }

    public function account()
    {
        // حساب الزبون — الصفحة تتعامل مع الـ token في JavaScript
        return view('storefront.account');
    }

    public function loginPage()
    {
        return view('storefront.login');
    }

    public function registerPage()
    {
        return view('storefront.register');
    }

    public function orderTrack()
    {
        return view('storefront.order-track');
    }

    public function privacy()
    {
        return view('storefront.policy', ['type' => 'privacy']);
    }

    public function terms()
    {
        return view('storefront.policy', ['type' => 'terms']);
    }

    public function checkout()
    {
        return view('storefront.checkout');
=======
use App\Models\Category;
use App\Models\Product;
use App\Models\Subcategory;
use App\Models\Template;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Inertia\Response;

class StorefrontController extends Controller
{
    public function home(Request $request): Response
    {
        return Inertia::render('Storefront/Home', [
            'categories' => Category::where('is_active', true)
                ->withCount('subcategories')
                ->orderBy('sort_order')
                ->get()
                ->map(fn ($c) => [
                    'id'                 => $c->id,
                    'name'               => $c->name,
                    'icon'               => $c->icon,
                    'slug'               => $c->slug,
                    'description'        => $c->description,
                    'subcategories_count'=> $c->subcategories_count,
                ]),
        ]);
    }

    public function shop(Request $request): RedirectResponse
    {
        return redirect()->route('categories');
    }

    public function categories(Request $request): Response
    {
        return Inertia::render('Storefront/Categories', [
            'categories' => Category::where('is_active', true)
                ->withCount('subcategories')
                ->with(['subcategories' => fn ($q) => $q->withCount('products')->where('is_active', true)->orderBy('sort_order')->limit(4)])
                ->orderBy('sort_order')
                ->get()
                ->map(fn (Category $c) => [
                    'id' => $c->id,
                    'name' => $c->name,
                    'slug' => $c->slug,
                    'icon' => $c->icon,
                    'description' => $c->description,
                    'subcategories_count' => $c->subcategories_count,
                    'subcategories' => $c->subcategories->map(fn ($s) => [
                        'id' => $s->id,
                        'name' => $s->name,
                        'slug' => $s->slug,
                        'products_count' => $s->products_count,
                    ]),
                ]),
        ]);
    }

    public function category(Request $request, Category $category): Response
    {
        abort_unless($category->is_active, 404);

        return Inertia::render('Storefront/Category', [
            'category' => [
                'id' => $category->id,
                'name' => $category->name,
                'slug' => $category->slug,
                'icon' => $category->icon,
                'description' => $category->description,
            ],
            'subcategories' => Subcategory::where('category_id', $category->id)
                ->where('is_active', true)
                ->withCount('products')
                ->with(['products' => fn ($q) => $q->where('is_active', true)->orderBy('sort_order')->limit(3)])
                ->orderBy('sort_order')
                ->get()
                ->map(fn (Subcategory $s) => [
                    'id' => $s->id,
                    'name' => $s->name,
                    'slug' => $s->slug,
                    'icon' => $s->icon,
                    'description' => $s->description,
                    'products_count' => $s->products_count,
                    'sample_products' => $s->products->map(fn ($p) => ['name' => $p->name, 'badge' => $p->badge]),
                ]),
        ]);
    }

    public function subcategory(Request $request, Category $category, Subcategory $subcategory): Response
    {
        abort_unless($subcategory->category_id === $category->id, 404);
        abort_unless($subcategory->is_active, 404);

        $user = $request->user();

        return Inertia::render('Storefront/Subcategory', [
            'category' => ['id' => $category->id, 'name' => $category->name, 'slug' => $category->slug, 'icon' => $category->icon],
            'subcategory' => ['id' => $subcategory->id, 'name' => $subcategory->name, 'slug' => $subcategory->slug, 'icon' => $subcategory->icon, 'description' => $subcategory->description],
            'products' => Product::where('subcategory_id', $subcategory->id)
                ->where('is_active', true)
                ->withCount('templates')
                ->orderBy('sort_order')
                ->get()
                ->map(fn (Product $p) => [
                    'id' => $p->id,
                    'name' => $p->name,
                    'slug' => $p->slug,
                    'description' => $p->description,
                    'price' => $p->priceFor($user),
                    'retail_price' => (float) $p->retail_price,
                    'badge' => $p->badge,
                    'cover_image' => $p->cover_image,
                    'templates_count' => $p->templates_count,
                ]),
        ]);
    }

    public function product(Request $request, Product $product): Response
    {
        abort_unless($product->is_active, 404);

        $user = $request->user();
        $product->load(['subcategory.category', 'templates' => fn ($q) => $q->where('is_active', true)->orderBy('sort_order')]);

        return Inertia::render('Storefront/Product', [
            'product' => [
                'id'          => $product->id,
                'name'        => $product->name,
                'slug'        => $product->slug,
                'description' => $product->description,
                'price'       => $product->priceFor($user),
                'retail_price'=> (float) $product->retail_price,
                'badge'       => $product->badge,
                'cover_image' => $product->cover_image,
                'sizes'       => $product->sizes ?? [],
                'subcategory' => ['id' => $product->subcategory->id, 'name' => $product->subcategory->name, 'slug' => $product->subcategory->slug],
                'category'    => ['id' => $product->subcategory->category->id, 'name' => $product->subcategory->category->name, 'slug' => $product->subcategory->category->slug],
                'templates'   => $product->templates->map(fn ($t) => [
                    'id'            => $t->id,
                    'name'          => $t->name,
                    'preview_image' => $t->preview_image,
                    'has_canva'     => $t->hasCanva(),
                ]),
            ],
            'authed' => (bool) $user,
        ]);
    }

    public function pricing(): Response
    {
        return Inertia::render('Storefront/Pricing');
    }

    public function about(): Response
    {
        return Inertia::render('Storefront/About');
    }

    public function contact(): Response
    {
        return Inertia::render('Storefront/Contact');
    }

    public function faq(): Response
    {
        return Inertia::render('Storefront/Faq');
    }

    private function templates(Request $request)
    {
        $user = $request->user();

        return Template::where('is_active', true)
            ->orderBy('sort_order')
            ->get()
            ->map(fn ($t) => $this->present($t, $user));
    }

    private function present(Template $t, $user): array
    {
        return [
            'id' => $t->id,
            'name' => $t->name,
            'slug' => $t->slug,
            'description' => $t->description,
            'category' => $t->category,
            'preview_image' => $t->preview_image,
            'badge' => $t->badge,
            'rating' => $t->rating,
            'reviews_count' => $t->reviews_count,
            'price' => $t->priceFor($user),
            'retail_price' => (float) $t->retail_price,
        ];
>>>>>>> 234599e73e73522fe1ac606664f852ec8702d836
    }
}
