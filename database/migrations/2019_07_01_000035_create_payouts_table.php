<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePayoutsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('payouts', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('user_id')->unsigned();
            $table->decimal('requested_amount', 8, 2)->default(0.0);
            $table->decimal('amount', 8, 2)->default(0.0);
            $table->enum('status', ['pending', 'process','complete', 'reject'])->default('pending');
            $table->timestamps();

            $table->foreign('user_id', 'payouts_foreign_user')
                ->references('id')
                ->on('users')
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
        Schema::table('payouts', function (Blueprint $table) {
            $table->dropForeign('payouts_foreign_user');
        });

        Schema::dropIfExists('payouts');
    }
}
