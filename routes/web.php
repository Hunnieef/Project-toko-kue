<?php

use App\Http\Controllers\ProfileController;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\HomeController;
use App\Http\Controllers\ShopController;

use App\Http\Controllers\WishlistController;
use App\Http\Controllers\CartController;
use App\Http\Controllers\CheckoutController;
use App\Http\Controllers\UserOrderController;

use App\Http\Controllers\Admin\ProductAdminController;
use App\Http\Controllers\Admin\ProductInventoryController;
use App\Http\Controllers\Admin\ProductDayQuotaController;
use App\Http\Controllers\Admin\StoreSettingController;
use App\Http\Controllers\Admin\OrderAdminController; // ✅ tambah ini

// ROOT
Route::get('/', function () {
    return redirect()->route('home');
});

// PUBLIC PAGES
Route::get('/home', [HomeController::class, 'index'])->name('home');
Route::view('/about', 'about')->name('about');
Route::view('/contact', 'contact')->name('contact');

// SHOP
Route::get('/shop', [ShopController::class, 'index'])->name('shop.index');
Route::get('/shop/category/{slug}', [ShopController::class, 'category'])->name('shop.category');
Route::get('/shop/{slug}', [ShopController::class, 'show'])->name('shop.show');

// DASHBOARD USER (breeze)
Route::get('/dashboard', function () {
    return view('dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

// PROFILE
Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'index'])->name('profile.index');
    Route::get('/profile/edit', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

// =====================
// ADMIN
// =====================
Route::prefix('admin')
    ->middleware(['auth', 'isAdmin'])
    ->name('admin.')
    ->group(function () {

        Route::view('/', 'admin.dashboard')->name('dashboard');

        // dashboard khusus store settings
        Route::view('/store-settings-dashboard', 'admin.store-settings-dashboard')
            ->name('storeSettings.dashboard');

        // PRODUCTS CRUD
        Route::get('/products', [ProductAdminController::class, 'index'])->name('products.index');
        Route::get('/products/create', [ProductAdminController::class, 'create'])->name('products.create');
        Route::post('/products', [ProductAdminController::class, 'store'])->name('products.store');
        Route::get('/products/{id}/edit', [ProductAdminController::class, 'edit'])->name('products.edit');
        Route::put('/products/{id}', [ProductAdminController::class, 'update'])->name('products.update');
        Route::delete('/products/{id}', [ProductAdminController::class, 'destroy'])->name('products.destroy');

        // INVENTORY (STOK & SOLD OUT)
        Route::post('/products/{product}/stock/add', [ProductInventoryController::class, 'addStock'])
            ->name('products.stock.add');
        Route::post('/products/{product}/stock/sub', [ProductInventoryController::class, 'subStock'])
            ->name('products.stock.sub');
        Route::post('/products/{product}/toggle-active', [ProductInventoryController::class, 'toggleActive'])
            ->name('products.toggleActive');

        // PRE-ORDER QUOTA
        Route::get('/quotas', [ProductDayQuotaController::class, 'index'])->name('quotas.index');
        Route::post('/quotas', [ProductDayQuotaController::class, 'store'])->name('quotas.store');

        // STORE SETTINGS (TOKO TUTUP/LIBUR)
        Route::get('/store-settings', [StoreSettingController::class, 'edit'])->name('storeSettings.edit');
        Route::post('/store-settings', [StoreSettingController::class, 'update'])->name('storeSettings.update');

        // ✅ ORDERS (KELOLA PESANAN)
        Route::get('/orders', [OrderAdminController::class, 'index'])->name('orders.index');
        Route::get('/orders/{order}', [OrderAdminController::class, 'show'])->name('orders.show');
        Route::patch('/orders/{order}/status', [OrderAdminController::class, 'updateStatus'])->name('orders.status');
        Route::get('/orders/{order}/invoice', [OrderAdminController::class, 'invoice'])->name('orders.invoice');
    });

// =====================
// USER (AUTH)
// =====================
Route::middleware('auth')->group(function () {

    // Wishlist
    Route::get('/wishlist', [WishlistController::class, 'index'])->name('wishlist.index');
    Route::post('/wishlist/add/{productId}', [WishlistController::class, 'add'])->name('wishlist.add');
    Route::post('/wishlist/remove/{productId}', [WishlistController::class, 'remove'])->name('wishlist.remove');

    // Cart
    Route::get('/cart', [CartController::class, 'index'])->name('cart.index');
    Route::post('/cart/add/{productId}', [CartController::class, 'add'])->name('cart.add');
    Route::post('/cart/remove/{productId}', [CartController::class, 'remove'])->name('cart.remove');

    // === MY ORDERS (TRACKING) ===
    Route::get('/orders', [UserOrderController::class, 'index'])->name('orders.index');
    Route::get('/orders/{order}', [UserOrderController::class, 'show'])->name('orders.show');
    Route::get('/orders/{order}/invoice', [UserOrderController::class, 'invoice'])->name('orders.invoice');
});

// ✅ Checkout saja yang dibatasi toko tutup
Route::middleware(['auth', 'store.open'])->group(function () {
    Route::get('/checkout', [CheckoutController::class, 'index'])->name('checkout.index');
    Route::post('/checkout', [CheckoutController::class, 'process'])->name('checkout.process');
    Route::get('/checkout/success', [CheckoutController::class, 'success'])->name('checkout.success');
});

require __DIR__ . '/auth.php';