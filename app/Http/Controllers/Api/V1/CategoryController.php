<?php

namespace App\Http\Controllers\Api\V1;

use App\CentralLogics\CategoryLogic;
use App\CentralLogics\Helpers;
use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Product;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Cache;

class CategoryController extends Controller
{
    public function __construct(
        private Category $category
    )
    {
    }

    /**
     * @return JsonResponse
     */
    public function getCategories(): JsonResponse
    {
        $locale = app()->getLocale();
        $cacheKey = CACHE_CATEGORY_TABLE . '_' . $locale;

        $categories = Cache::rememberForever($cacheKey, function () {
            return $this->category->where(['parent_id' => 0, 'status' => 1])->orderBy('position')->get();
        });

        foreach ($categories as $category) {
            $category['products_count'] = Product::whereJsonContains('category_ids', ['id' => (string)$category['id']])->count();
        }

        return response()->json($categories, 200);
    }

    /**
     * @param $id
     * @return JsonResponse
     */
    public function getChildes($id): JsonResponse
    {
        $cacheKey = CACHE_CATEGORY_CHILDREN . '_' . $id;
        $categories = Cache::remember($cacheKey, now()->addHours(1), function () use ($id) {
            return $this->category->where(['parent_id' => $id, 'status' => 1])->get();
        });
        return response()->json($categories, 200);
    }

    /**
     * @param $id
     * @return JsonResponse
     */
    public function getProducts($id): JsonResponse
    {
        $products = Helpers::product_data_formatting(CategoryLogic::products($id), true);
        $products = Helpers::apply_user_type_prices_to_products($products, true);
        return response()->json($products, 200);
    }

    /**
     * @param $id
     * @return JsonResponse
     */
    public function getAllProducts($id): JsonResponse
    {
        try {
            $products = Helpers::product_data_formatting(CategoryLogic::all_products($id), true);
            $products = Helpers::apply_user_type_prices_to_products($products, true);
            return response()->json($products, 200);
        } catch (\Exception $e) {
            return response()->json([], 200);
        }
    }

    /**
     * @return JsonResponse
     */
    public function getFeaturedCategories(): JsonResponse
    {
        $cacheKey = CACHE_FEATURED_CATEGORIES . '_' . app()->getLocale();
        $featuredData = Cache::remember($cacheKey, now()->addMinutes(30), function () {
            $featuredCategoryList = Category::active()->where(['is_featured' => 1])->get();
            $data = [];
            foreach ($featuredCategoryList as $category) {
                $products = Product::active()->whereJsonContains('category_ids', ['id' => (string)$category->id])->take(15)->get();
                if ($products->count() > 0) {
                    $formatted = Helpers::product_data_formatting($products, true);
                    $formatted = Helpers::apply_user_type_prices_to_products($formatted, true);
                    $data[] = [
                        'category' => $category,
                        'products' => $formatted
                    ];
                }
            }
            return $data;
        });
        return response()->json(['featured_data' => $featuredData], 200);
    }
    public function getPopularCategories(): JsonResponse
    {
        $locale = app()->getLocale();
        $cacheKey = CACHE_POPULAR_CATEGORY_TABLE . '_' . $locale;

        $categories = Cache::rememberForever($cacheKey, function () {
            return $this->category->where(['parent_id' => 0, 'status' => 1, 'is_featured' => 1])->orderBy('position')->get();
        });
        return response()->json($categories, 200);
    }
}
