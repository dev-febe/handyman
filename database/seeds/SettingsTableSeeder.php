<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class SettingsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('settings')->insert([
            ["key" => "currency", "value" => "INR"],
            ["key" => "admin_fee_for_order_in_percent", "value" => "10"],
            ["key" => "tax_in_percent", "value" => "10"],
            ["key" => "support_email", "value" => "admin@example.com"],
            ["key" => "support_phone", "value" => "8181818118"],
            ["key" => "distance_limit", "value" => "30"],
            ["key" => "privacy_policy", "value" => "Demo privacy policy"],
            ["key" => "about_us", "value" => "Demo privacy policy"],
            ["key" => "faq", "value" => "Demo FAQ"],
            ["key" => "terms", "value" => "Demo Terms and Condition"]
        ]);
    }
}
