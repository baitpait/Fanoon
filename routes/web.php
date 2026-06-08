<?php

use App\Http\Controllers\Admin\AdminUserController;
use App\Http\Controllers\Admin\CategoryController as AdminCategoryController;
use App\Http\Controllers\Admin\DesignController as AdminDesignController;
use App\Http\Controllers\Admin\SubcategoryController as AdminSubcategoryController;
use App\Http\Controllers\Admin\ProductController as AdminProductController;
use App\Http\Controllers\Admin\AuthController as AdminAuthController;
use App\Http\Controllers\Admin\CompanyController as AdminCompanyController;
use App\Http\Controllers\Admin\CustomerController as AdminCustomerController;
use App\Http\Controllers\Admin\DashboardController as AdminDashboardController;
use App\Http\Controllers\Admin\DeliveryZoneController as AdminDeliveryZoneController;
use App\Http\Controllers\Admin\OrderController as AdminOrderController;
use App\Http\Controllers\Admin\ReportController as AdminReportController;
use App\Http\Controllers\Admin\ReviewController as AdminReviewController;
use App\Http\Controllers\Admin\SettingController as AdminSettingController;
use App\Http\Controllers\Admin\TemplateController as AdminTemplateController;
use App\Http\Controllers\CanvaController;
use App\Http\Controllers\DirectUploadController;
use App\Http\Controllers\OrderTrackingController;
use App\Http\Controllers\CartController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\StorefrontController;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

/* ---------------- Public storefront ---------------- */
Route::get('/', [StorefrontController::class, 'home'])->name('home');
Route::get('/shop', [StorefrontController::class, 'shop'])->name('shop');
Route::get('/categories', [StorefrontController::class, 'categories'])->name('categories');
Route::get('/categories/{category:slug}', [StorefrontController::class, 'category'])->name('category.show');
Route::get('/categories/{category:slug}/{subcategory:slug}', [StorefrontController::class, 'subcategory'])->name('subcategory.show');
Route::get('/products/{product:slug}', [StorefrontController::class, 'product'])->name('product.show');
Route::get('/pricing', [StorefrontController::class, 'pricing'])->name('pricing');
Route::get('/about', [StorefrontController::class, 'about'])->name('about');
Route::get('/contact', [StorefrontController::class, 'contact'])->name('contact');
Route::get('/faq', [StorefrontController::class, 'faq'])->name('faq');
Route::get('/track', [OrderTrackingController::class, 'index'])->name('track');

/* ---------------- Authenticated customer area ---------------- */
Route::middleware('auth')->group(function () {
    // Cart
    Route::get('/cart', [CartController::class, 'index'])->name('cart.index');
    Route::patch('/cart/{cartItem}', [CartController::class, 'update'])->name('cart.update');
    Route::delete('/cart/{cartItem}', [CartController::class, 'destroy'])->name('cart.destroy');

    // Orders (checkout)
    Route::get('/checkout', [OrderController::class, 'checkoutPage'])->name('checkout');
    Route::get('/orders', [OrderController::class, 'index'])->name('orders.index');
    Route::post('/orders', [OrderController::class, 'store'])->name('orders.store');
    Route::get('/orders/{order}', [OrderController::class, 'show'])->name('orders.show');

    // Account dashboard
    Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboard');

    // Profile (Breeze)
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

/* ---------------- Direct upload (auth required) ---------------- */
Route::middleware('auth')->group(function () {
    Route::get('/upload/{product:slug}', [DirectUploadController::class, 'page'])->name('upload.page');
    Route::post('/upload/{product:slug}', [DirectUploadController::class, 'store'])->name('upload.store');
});

/* ---------------- Canva flow (auth required) ---------------- */
Route::middleware('auth')->group(function () {
    // Canva external flow — redirects to Canva copy link then returns here to upload
    Route::get('/canva/start/{productTemplate}', [CanvaController::class, 'start'])->name('canva.start');
    Route::get('/canva/submit/{productTemplate}', [CanvaController::class, 'submitPage'])->name('canva.submit');
    Route::post('/canva/submit/{productTemplate}', [CanvaController::class, 'submit'])->name('canva.submit.store');
});

/* ---------------- Admin login (no guest guard — controller handles redirect) ---------------- */
Route::prefix('admin')->name('admin.')->group(function () {
    Route::get('/login', [AdminAuthController::class, 'create'])->name('login');
    Route::post('/login', [AdminAuthController::class, 'store'])->name('login.store');
});

/* ---------------- Admin panel ---------------- */
Route::middleware(['auth', 'admin'])->prefix('admin')->name('admin.')->group(function () {
    Route::get('/', [AdminDashboardController::class, 'index'])->name('dashboard');

    Route::get('/orders', [AdminOrderController::class, 'index'])->name('orders.index');
    Route::get('/orders/{order}', [AdminOrderController::class, 'show'])->name('orders.show');
    Route::patch('/orders/{order}', [AdminOrderController::class, 'update'])->name('orders.update');

    // Customer designs gallery + promote to template
    Route::get('/designs', [AdminDesignController::class, 'index'])->name('designs.index');
    Route::post('/designs/{design}/promote-template', [AdminDesignController::class, 'promoteToTemplate'])->name('designs.promote');

    Route::get('/companies', [AdminCompanyController::class, 'index'])->name('companies.index');
    Route::get('/companies/{company}', [AdminCompanyController::class, 'show'])->name('companies.show');
    Route::patch('/companies/{company}', [AdminCompanyController::class, 'update'])->name('companies.update');

    // Template management (now uses ProductTemplate)
    Route::get('/templates', [AdminTemplateController::class, 'index'])->name('templates.index');
    Route::get('/templates/create', [AdminTemplateController::class, 'create'])->name('templates.create');
    Route::post('/templates', [AdminTemplateController::class, 'store'])->name('templates.store');
    Route::get('/templates/{productTemplate}/edit', [AdminTemplateController::class, 'edit'])->name('templates.edit');
    Route::post('/templates/{productTemplate}', [AdminTemplateController::class, 'update'])->name('templates.update');
    Route::patch('/templates/{productTemplate}/toggle', [AdminTemplateController::class, 'toggle'])->name('templates.toggle');
    Route::delete('/templates/{productTemplate}', [AdminTemplateController::class, 'destroy'])->name('templates.destroy');

    // Customers
    Route::get('/customers', [AdminCustomerController::class, 'index'])->name('customers.index');
    Route::patch('/customers/{customer}', [AdminCustomerController::class, 'update'])->name('customers.update');

    // Store settings
    Route::get('/settings', [AdminSettingController::class, 'edit'])->name('settings.edit');
    Route::patch('/settings', [AdminSettingController::class, 'update'])->name('settings.update');

    // مناطق التوصيل
    Route::get('/delivery-zones', [AdminDeliveryZoneController::class, 'index'])->name('zones.index');
    Route::post('/delivery-zones', [AdminDeliveryZoneController::class, 'store'])->name('zones.store');
    Route::patch('/delivery-zones/{zone}', [AdminDeliveryZoneController::class, 'update'])->name('zones.update');
    Route::patch('/delivery-zones/{zone}/toggle', [AdminDeliveryZoneController::class, 'toggle'])->name('zones.toggle');
    Route::delete('/delivery-zones/{zone}', [AdminDeliveryZoneController::class, 'destroy'])->name('zones.destroy');

    // التقييمات
    Route::get('/reviews', [AdminReviewController::class, 'index'])->name('reviews.index');
    Route::patch('/reviews/{review}/toggle', [AdminReviewController::class, 'toggle'])->name('reviews.toggle');
    Route::delete('/reviews/{review}', [AdminReviewController::class, 'destroy'])->name('reviews.destroy');

    // المستخدمون (المدراء)
    Route::get('/users', [AdminUserController::class, 'index'])->name('users.index');
    Route::post('/users', [AdminUserController::class, 'store'])->name('users.store');
    Route::patch('/users/{user}/role', [AdminUserController::class, 'updateRole'])->name('users.role');
    Route::delete('/users/{user}', [AdminUserController::class, 'destroy'])->name('users.destroy');

    // التقارير
    Route::get('/reports/sales', [AdminReportController::class, 'sales'])->name('reports.sales');
    Route::get('/reports/financial', [AdminReportController::class, 'financial'])->name('reports.financial');
    Route::get('/reports/visitors', [AdminReportController::class, 'visitors'])->name('reports.visitors');

    // التصنيفات
    Route::get('/categories', [AdminCategoryController::class, 'index'])->name('categories.index');
    Route::post('/categories', [AdminCategoryController::class, 'store'])->name('categories.store');
    Route::patch('/categories/{category}', [AdminCategoryController::class, 'update'])->name('categories.update');
    Route::delete('/categories/{category}', [AdminCategoryController::class, 'destroy'])->name('categories.destroy');

    // التصنيفات الفرعية
    Route::post('/subcategories', [AdminSubcategoryController::class, 'store'])->name('subcategories.store');
    Route::patch('/subcategories/{subcategory}', [AdminSubcategoryController::class, 'update'])->name('subcategories.update');
    Route::delete('/subcategories/{subcategory}', [AdminSubcategoryController::class, 'destroy'])->name('subcategories.destroy');

    // المنتجات
    Route::get('/products', [AdminProductController::class, 'index'])->name('products.index');
    Route::post('/products', [AdminProductController::class, 'store'])->name('products.store');
    Route::get('/products/{product}/edit', [AdminProductController::class, 'edit'])->name('products.edit');
    Route::patch('/products/{product}', [AdminProductController::class, 'update'])->name('products.update');
    Route::delete('/products/{product}', [AdminProductController::class, 'destroy'])->name('products.destroy');
    Route::post('/products/{product}/templates', [AdminProductController::class, 'storeTemplate'])->name('products.templates.store');
    Route::patch('/product-templates/{template}', [AdminProductController::class, 'updateTemplate'])->name('products.templates.update');
    Route::delete('/product-templates/{template}', [AdminProductController::class, 'destroyTemplate'])->name('products.templates.destroy');
});

require __DIR__.'/auth.php';
