<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
<<<<<<< HEAD
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Facades\Storage;

class Category extends Model
{
    protected $casts = [
        'parent_id'              => 'integer',
        'position'               => 'integer',
        'status'                 => 'integer',
        'is_featured'            => 'integer',
        'visible_to_user_types'  => 'array',  // NULL = everyone; [] = hidden; [id,...] = specific types; 0 = guests
    ];

    public function translations(): \Illuminate\Database\Eloquent\Relations\MorphMany
    {
        return $this->morphMany('App\Models\Translation', 'translationable');
    }

    public function scopeActive($query)
    {
        return $query->where('status', '=', 1);
    }

    public function childes(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(Category::class, 'parent_id');
    }

    public function parent(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(Category::class, 'parent_id');
    }

    public function getNameAttribute($name)
    {
        if(auth('admin')->check()||auth('branch')->check())
        {
            return $name;
        }
        return $this->translations[0]->value??$name;
    }

    protected $appends = ['image_fullpath', 'banner_image_fullpath'];

    public function getImageFullPathAttribute(): string
    {
        $image = $this->image ?? null;
        $path = asset('assets/admin/img/160x160/img2.jpg');

        if (!is_null($image) && Storage::disk('public')->exists('category/' . $image)) {
            $path = asset('storage/category/' . $image);
        }
        return $path;
    }
    public function getBannerImageFullPathAttribute(): string
    {
        $image = $this->banner_image ?? null;
        $path = asset('assets/admin/img/8_1.png');

        if (!is_null($image) && Storage::disk('public')->exists('category/banner/' . $image)) {
            $path = asset('storage/category/banner/' . $image);
        }
        return $path;
    }

    protected static function booted(): void
    {
        static::addGlobalScope('translate', function (Builder $builder) {
            $builder->with(['translations' => function($query){
                return $query->where('locale', app()->getLocale());
            }]);
        });
=======
use Illuminate\Database\Eloquent\Relations\HasMany;

class Category extends Model
{
    protected $fillable = ['name', 'slug', 'icon', 'description', 'cover_image', 'sort_order', 'is_active'];

    protected $casts = ['is_active' => 'boolean'];

    public function subcategories(): HasMany
    {
        return $this->hasMany(Subcategory::class)->orderBy('sort_order');
>>>>>>> 234599e73e73522fe1ac606664f852ec8702d836
    }
}
