<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class PlanTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table(config('rinvex.subscriptions.tables.plans'))->insert([
            [
                "slug" => "premium",
                "name" => "Premium",
                "description" => "Get unlimited leads for a month",
                "price" => "50",
                "currency" => "inr",
            ],
            [
                "slug" => "economy",
                "name" => "Economy",
                "description" => "Get 150 leads for a month",
                "price" => "30",
                "currency" => "inr",
            ],
            [
                "slug" => "basic",
                "name" => "Basic",
                "description" => "Get 30 leads for a month",
                "price" => "10",
                "currency" => "inr",
            ],
        ]);
    }
}
