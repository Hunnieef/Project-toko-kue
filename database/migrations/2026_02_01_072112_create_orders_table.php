<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
        Schema::create('orders', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->nullable()->constrained()->nullOnDelete();

            $table->string('full_name');
            $table->string('phone', 30);
            $table->text('address');

            $table->enum('shipping_method', ['delivery', 'pickup']);
            $table->enum('payment_method', ['bank_transfer', 'midtrans']);

            $table->decimal('total', 15, 2)->default(0);
            $table->string('status')->default('pending'); // pending/paid/cancelled

            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('orders');
    }
};