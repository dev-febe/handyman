<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AlterTransactionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('transactions', function (Blueprint $table) {
            $table->boolean('is_paid')->default(false);
            $table->string('source'); // e.g. refer, withdraw_to_bank, appointment etc
            $table->string('image_url')->nullable();
            $table->integer('appointment_id')->unsigned()->nullable();

            $table->foreign('appointment_id', 'transactions_foreign_appointment')
                ->references('id')
                ->on('appointments')
                ->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('transactions', function (Blueprint $table) {
            $table->dropForeign('transactions_foreign_appointment');
            $table->dropColumn('is_paid');
            $table->dropColumn('source');
            $table->dropColumn('image_url');
            $table->dropColumn('appointment_id');
        });
    }
}
