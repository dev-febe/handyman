<?php

namespace App\Http\Controllers\Api\Provider;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\Customer\AddressCreateRequest;
use App\Http\Requests\Api\Provider\ProviderUpdateRequest;
use App\Http\Requests\ApiStripePaymentRequest;
use App\Models\Address;
use App\Models\Setting;
use Cartalyst\Stripe\Laravel\Facades\Stripe;
use Illuminate\Support\Facades\Auth;
use Rinvex\Subscriptions\Models\Plan;

class PlanController extends Controller
{
    public function plans()
    {
        return response()->json(Plan::with('features')->get());
    }

    public function planDetails()
    {
        $user = Auth::user();
        $user->subscription('main')->getFeatureUsage('leads-per-day');
        return response([
            "subscription" => $user->subscription('main'),
            "active" => $user->subscription('main')->active(),
        ]);
    }

    public function makeStripePayment(Plan $plan, ApiStripePaymentRequest $request)
    {
        if(env('DEMO_SKIP_PAYMENT')) {
            $this->onPaymentSuccess($plan);
            return response()->json(["status" => true]);
        }

        $amount = number_format((float)$plan->price, 2, '.', '');
        $currency = Setting::where('key', 'currency')->first()->value;

        try {
            $token = $request->token;
            $charge = Stripe::charges()->create([
                'amount' => $amount,
                'currency' => strtolower($currency),
                'description' => 'Payment for Plan ' . $plan->name,
                'source' => $token,
            ]);

            $this->onPaymentSuccess($plan);

            return response()->json(["status" => true, 'charge' => $charge]);
        } catch(\Exception $ex) {
            abort(400);
        }
    }

    private function onPaymentSuccess(Plan $plan)
    {
        $user = Auth::user();

        $user->newSubscription('main', $plan);
    }
}
