<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
<<<<<<< HEAD
=======
use Illuminate\Database\Eloquent\Relations\HasMany;
>>>>>>> 234599e73e73522fe1ac606664f852ec8702d836

class Order extends Model
{
    protected $fillable = [
<<<<<<< HEAD
        'user_id',
        'is_guest',
        'order_amount',
        'coupon_discount_amount',
        'coupon_discount_title',
        'payment_status',
        'order_status',
        'total_tax_amount',
        'payment_method',
        'additional_payment_method',
        'additional_payment_amount',
        'transaction_reference',
        'delivery_address_id',
        'created_at',
        'updated_at',
        'checked',
        'delivery_charge',
        'order_note',
        'coupon_code',
        'order_type',
        'branch_id',
        'callback',
        'extra_discount',
        'loyalty_points_used',
        'loyalty_discount_amount',
        'delivery_address',
        'bring_change_amount',
        'paid_amount',
        'wallet',
    ];

    protected $casts = [
        'order_amount' => 'float',
        'coupon_discount_amount' => 'float',
        'total_tax_amount' => 'float',
        'delivery_address_id' => 'integer',
        'delivery_charge' => 'float',
        'user_id' => 'integer',
        'delivery_address' => 'array',
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
        'bring_change_amount' => 'float',
        'paid_amount' => 'float',
        'loyalty_discount_amount' => 'float',
        'additional_payment_method' => 'array',
        'additional_payment_amount' => 'array',
    ];

    public function details(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(OrderDetail::class);
    }

    public function customer(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function branch(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(Branch::class, 'branch_id');
    }

    public function orderShipments(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(OrderShipment::class);
    }

    public function deliveryAddress(): BelongsTo
    {
        return $this->belongsTo(CustomerAddress::class, 'delivery_address_id');
    }

    public function scopePos($query)
    {
        return $query->where('order_type', '=', 'pos');
    }

    public function scopeNotPos($query)
    {
        return $query->where(function ($q) {
            $q->where('order_type', '!=', 'pos')->orWhereNull('order_type');
        });
    }

    public function guest()
    {
        return $this->belongsTo(GuestUser::class, 'user_id');
    }

    public function orderArea()
    {
        return $this->hasOne(OrderArea::class);
    }

    public function statusLogs(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(OrderStatusLog::class)->orderByDesc('created_at');
    }

    public static function booted()
    {
        static::creating(function ($order) {
            // Generate a custom Order ID
            if (!$order->id) {
                // If order_id needs to follow a custom format like ORD-XXXX, based on the last inserted order
                $lastOrder = self::latest('id')->first();
                $order->id = $lastOrder ? $lastOrder->id + 1 : 100001; // Defaulting to 100000 if no last order exists
            }
        });
=======
        'user_id', 'delivery_zone_id', 'reference', 'status', 'pricing_tier',
        'subtotal', 'delivery_fee', 'total',
        'contact_name', 'contact_phone', 'contact_email',
        'shipping_city', 'shipping_address', 'shipping_neighborhood', 'shipping_building',
        'payment_method', 'notes', 'admin_notes',
    ];

    protected $casts = [
        'subtotal'      => 'decimal:2',
        'delivery_fee'  => 'decimal:2',
        'total'         => 'decimal:2',
    ];

    public const STATUSES = [
        'pending_review' => 'قيد المراجعة',
        'approved' => 'تمت الموافقة',
        'in_production' => 'قيد التصنيع',
        'ready' => 'جاهز للتسليم',
        'delivered' => 'تم التسليم',
        'cancelled' => 'ملغي',
    ];

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }

    public function deliveryZone(): BelongsTo
    {
        return $this->belongsTo(DeliveryZone::class);
    }

    public function items(): HasMany
    {
        return $this->hasMany(OrderItem::class);
    }

    public function statusLabel(): string
    {
        return self::STATUSES[$this->status] ?? $this->status;
>>>>>>> 234599e73e73522fe1ac606664f852ec8702d836
    }
}
