<?php

namespace App\Models;

<<<<<<< HEAD
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Illuminate\Support\Facades\Storage;
use Laravel\Passport\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, Notifiable;
=======
// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Database\Factories\UserFactory;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable
{
    /** @use HasFactory<UserFactory> */
    use HasFactory, Notifiable;
>>>>>>> 234599e73e73522fe1ac606664f852ec8702d836

    /**
     * The attributes that are mass assignable.
     *
<<<<<<< HEAD
     * @var array
     */
    protected $fillable = [
        'name', 'f_name', 'l_name', 'phone', 'email', 'password',
        'user_type_id', 'requested_user_type_id',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
        'is_phone_verified' => 'integer',
    ];

    protected $appends = ['image_fullpath'];

    public function getImageFullPathAttribute(): string
    {
        $image = $this->image ?? null;
        $path = asset('assets/admin/img/160x160/img1.jpg');

        if (!is_null($image) && Storage::disk('public')->exists('profile/' . $image)) {
            $path = asset('storage/profile/' . $image);
        }
        return $path;
    }

    public function orders(){
        return $this->hasMany(Order::class,'user_id');
    }

    public function addresses(){
        return $this->hasMany(CustomerAddress::class,'user_id');
    }

    public function wishlist_products()
    {
        return $this->hasMany(Wishlist::class,'user_id');
    }

    public function userType(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(UserType::class, 'user_type_id');
    }

    public function requestedUserType(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(UserType::class, 'requested_user_type_id');
    }

    public function loyaltyPoint(): \Illuminate\Database\Eloquent\Relations\HasOne
    {
        return $this->hasOne(LoyaltyPoint::class);
    }

    /**
     * Get the effective user type (assigned type or default).
     */
    public function effectiveUserType(): ?UserType
    {
        if ($this->user_type_id) {
            return $this->userType;
        }
        return UserType::getDefault();
=======
     * @var list<string>
     */
    /* ─── Admin role constants ─── */
    const ROLE_SUPER_ADMIN       = 'super_admin';
    const ROLE_ORDERS_MANAGER    = 'orders_manager';
    const ROLE_PRODUCTS_MANAGER  = 'products_manager';
    const ROLE_GENERAL_SUPERVISOR = 'general_supervisor';

    /** Routes each restricted role may access (prefix match: trailing dot = wildcard) */
    const ROLE_PERMISSIONS = [
        self::ROLE_ORDERS_MANAGER => [
            'admin.dashboard',
            'admin.orders.',
            'admin.customers.',
            'admin.zones.',
        ],
        self::ROLE_PRODUCTS_MANAGER => [
            'admin.dashboard',
            'admin.products.',
            'admin.templates.',
            'admin.categories.',
            'admin.subcategories.',
            'admin.designs.',
        ],
        self::ROLE_GENERAL_SUPERVISOR => [
            'admin.dashboard',
            'admin.orders.index',
            'admin.orders.show',
            'admin.customers.index',
            'admin.products.index',
            'admin.products.edit',
            'admin.templates.index',
            'admin.categories.index',
            'admin.designs.index',
            'admin.reports.',
            'admin.reviews.',
            'admin.companies.',
        ],
    ];

    protected $fillable = [
        'name',
        'email',
        'password',
        'account_type',
        'admin_role',
        'phone',
        'company_status',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var list<string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * Get the attributes that should be cast.
     *
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
            'password' => 'hashed',
        ];
    }

    /* ---------------- Relationships ---------------- */

    public function companyProfile(): HasOne
    {
        return $this->hasOne(CompanyProfile::class);
    }

    public function designs(): HasMany
    {
        return $this->hasMany(Design::class);
    }

    public function cartItems(): HasMany
    {
        return $this->hasMany(CartItem::class);
    }

    public function orders(): HasMany
    {
        return $this->hasMany(Order::class);
    }

    /* ---------------- Role helpers ---------------- */

    public function isAdmin(): bool
    {
        return $this->account_type === 'admin';
    }

    public function isCompany(): bool
    {
        return $this->account_type === 'company';
    }

    /** Returns the effective role; null admin_role → super_admin (backward compat). */
    public function effectiveAdminRole(): string
    {
        if (! $this->isAdmin()) return '';
        return $this->admin_role ?? self::ROLE_SUPER_ADMIN;
    }

    public function isSuperAdmin(): bool
    {
        return $this->isAdmin() && $this->effectiveAdminRole() === self::ROLE_SUPER_ADMIN;
    }

    /** Arabic label for display. */
    public function adminRoleLabel(): string
    {
        return match ($this->effectiveAdminRole()) {
            self::ROLE_SUPER_ADMIN        => 'سوبر أدمن',
            self::ROLE_ORDERS_MANAGER     => 'مدير طلبات',
            self::ROLE_PRODUCTS_MANAGER   => 'مدير منتجات',
            self::ROLE_GENERAL_SUPERVISOR => 'مشرف عام',
            default                       => 'مدير',
        };
    }

    /**
     * Check whether this user may access the given admin route.
     * super_admin (or null role) → always allowed.
     */
    public function canAccessRoute(string $routeName): bool
    {
        if (! $this->isAdmin()) return false;

        $role = $this->effectiveAdminRole();
        if ($role === self::ROLE_SUPER_ADMIN) return true;

        $allowed = self::ROLE_PERMISSIONS[$role] ?? [];

        foreach ($allowed as $entry) {
            // trailing dot → prefix match ("admin.orders." matches "admin.orders.index")
            if (str_ends_with($entry, '.')) {
                if (str_starts_with($routeName, $entry)) return true;
            } else {
                if ($routeName === $entry) return true;
            }
        }

        return false;
    }

    /** Approved companies (and admins) see wholesale prices. */
    public function seesWholesale(): bool
    {
        return $this->isAdmin()
            || ($this->isCompany() && $this->company_status === 'approved');
    }

    public function pricingTier(): string
    {
        return $this->seesWholesale() ? 'wholesale' : 'retail';
>>>>>>> 234599e73e73522fe1ac606664f852ec8702d836
    }
}
