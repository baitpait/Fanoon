<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
<<<<<<< HEAD
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Facades\Storage;

class Product extends Model
{

    protected $casts = [
        'tax' => 'float',
        'price' => 'float',
        'status' => 'integer',
        'discount' => 'float',
        'set_menu' => 'integer',
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
        'wishlist_count' => 'integer',
        'total_stock' => 'integer',
        'minimum_stock_alert' => 'integer',
    ];

    protected $appends = ['image_fullpath'];

    /**
     * المنتجات التي انخفض مخزونها عن حد التنبيه.
     */
    public function scopeLowStock($query, ?int $defaultAlert = null)
    {
        $default = $defaultAlert ?? (int) (\App\CentralLogics\Helpers::get_business_settings('default_minimum_stock_alert') ?? 5);
        return $query->where(function ($q) use ($default) {
            $q->whereNotNull('minimum_stock_alert')
                ->whereColumn('total_stock', '<=', 'minimum_stock_alert');
        })->orWhere(function ($q) use ($default) {
            $q->whereNull('minimum_stock_alert')
                ->where('total_stock', '<=', $default)
                ->where('total_stock', '>=', 0);
        });
    }

    public function getImageFullPathAttribute()
    {
        $value = $this->image ?? [];
        $imageUrlArray = is_array($value) ? $value : json_decode($value, true);
        if (is_array($imageUrlArray)) {
            if (empty($imageUrlArray))
            {
                return [asset('assets/admin/img/160x160/img2.jpg')];
            }
            foreach ($imageUrlArray as $key => $item) {
                if (Storage::disk('public')->exists('product/' . $item)) {
                    $imageUrlArray[$key] = asset('storage/product/'. $item) ;
                } else {
                    $imageUrlArray[$key] = asset('assets/admin/img/160x160/img2.jpg');
                }
            }
        }
        return $imageUrlArray;
    }

    public function translations(): \Illuminate\Database\Eloquent\Relations\MorphMany
    {
        return $this->morphMany(Translation::class, 'translationable');
    }

    public function scopeActive($query)
    {
        return $query->where('status', '=', 1);
    }

    public function reviews(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(Review::class);
    }

    public function wishlist()
    {
        return $this->hasMany(Wishlist::class)->latest();
    }

    public function rating()
    {
        return $this->hasMany(Review::class)
            ->select(DB::raw('avg(rating) average, product_id'))
            ->groupBy('product_id');
    }

    public function userTypePrices(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(ProductUserTypePrice::class);
    }

    public function userTypeDiscounts(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(ProductUserTypeDiscount::class);
    }

    public function tags(): \Illuminate\Database\Eloquent\Relations\BelongsToMany
    {
        return $this->belongsToMany(Tag::class, 'product_tag')->withTimestamps();
    }

    public function productRelations(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(ProductRelation::class, 'product_id');
    }

    public function relatedProducts(): \Illuminate\Database\Eloquent\Relations\BelongsToMany
    {
        return $this->belongsToMany(Product::class, 'product_relations', 'product_id', 'related_product_id')
            ->withPivot('sort_order')
            ->withTimestamps()
            ->orderByPivot('sort_order');
    }

    protected static function booted()
    {
        static::addGlobalScope('translate', function (Builder $builder) {
            $builder->with(['translations' => function($query){
                return $query->where('locale', app()->getLocale());
            }]);
        });
=======
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Product extends Model
{
    protected $fillable = [
        'subcategory_id', 'name', 'slug', 'description',
        'retail_price', 'wholesale_price', 'badge', 'cover_image',
        'sizes', 'sort_order', 'is_active',
    ];

    protected $casts = [
        'retail_price' => 'decimal:2',
        'wholesale_price' => 'decimal:2',
        'is_active' => 'boolean',
        'sizes' => 'array',
    ];

    public function subcategory(): BelongsTo
    {
        return $this->belongsTo(Subcategory::class);
    }

    public function templates(): HasMany
    {
        return $this->hasMany(ProductTemplate::class)->orderBy('sort_order');
    }

    public function priceFor(?User $user): float
    {
        return $user && $user->seesWholesale()
            ? (float) $this->wholesale_price
            : (float) $this->retail_price;
>>>>>>> 234599e73e73522fe1ac606664f852ec8702d836
    }
}
