<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Rinvex\Subscriptions\Models\Plan;
use Rinvex\Subscriptions\Models\PlanFeature;

class PlanTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $premium = app('rinvex.subscriptions.plan')->create([
            'name' => 'Premium',
            'description' => 'Get 10 leads for a month',
            'price' => 50.0,
            'signup_fee' => 50.0,
            'invoice_period' => 1,
            'invoice_interval' => 'month',
            'trial_period' => 15,
            'trial_interval' => 'day',
            'sort_order' => 1,
            'currency' => 'INR',
        ]);

        $economy = app('rinvex.subscriptions.plan')->create([
            'name' => 'Economy',
            'description' => 'Get 5 leads for a month',
            'price' => 30.0,
            'signup_fee' => 30.0,
            'invoice_period' => 1,
            'invoice_interval' => 'month',
            'trial_period' => 15,
            'trial_interval' => 'day',
            'sort_order' => 1,
            'currency' => 'INR',
        ]);

        $basic = app('rinvex.subscriptions.plan')->create([
            'name' => 'Basic',
            'description' => 'Get 1 leads for a month',
            'price' => 10.0,
            'signup_fee' => 10.0,
            'invoice_period' => 1,
            'invoice_interval' => 'month',
            'trial_period' => 15,
            'trial_interval' => 'day',
            'sort_order' => 1,
            'currency' => 'INR',
        ]);

        $free = app('rinvex.subscriptions.plan')->create([
            'name' => 'Free',
            'description' => 'Get 0 leads for a month',
            'price' => 0,
            'signup_fee' => 0,
            'invoice_period' => 1,
            'invoice_interval' => 'month',
            'trial_period' => 15,
            'trial_interval' => 'day',
            'sort_order' => 1,
            'currency' => 'INR',
        ]);

        $premium->features()->saveMany([
            new PlanFeature(['name' => 'leads_per_day', 'value' => 20, 'sort_order' => 1]),
        ]);

        $economy->features()->saveMany([
            new PlanFeature(['name' => 'leads_per_day', 'value' => 5, 'sort_order' => 1]),
        ]);

        $basic->features()->saveMany([
            new PlanFeature(['name' => 'leads_per_day', 'value' => 1, 'sort_order' => 1]),
        ]);

        $free->features()->saveMany([
            new PlanFeature(['name' => 'leads_per_day', 'value' => 0, 'sort_order' => 1]),
        ]);
    }
}
