<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
        Schema::table('orders', function (Blueprint $table) {
            // supaya filter lebih cepat
            $table->index('status');

            // optional, tapi berguna buat laporan/riwayat
            $table->timestamp('paid_at')->nullable()->after('status');
            $table->timestamp('cancelled_at')->nullable()->after('paid_at');
            $table->timestamp('delivered_at')->nullable()->after('cancelled_at');
        });
    }

    public function down(): void
    {
        Schema::table('orders', function (Blueprint $table) {
            $table->dropIndex(['status']);
            $table->dropColumn(['paid_at','cancelled_at','delivered_at']);
        });
    }
};