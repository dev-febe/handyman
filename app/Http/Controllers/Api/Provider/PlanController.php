<?php

namespace App\Http\Controllers\Api\Provider;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\Customer\AddressCreateRequest;
use App\Http\Requests\Api\Provider\ProviderUpdateRequest;
use App\Models\Address;
use Illuminate\Support\Facades\Auth;
use Rinvex\Subscriptions\Models\Plan;

class PlanController extends Controller
{
    public function plans()
    {
        return response()->json(Plan::all());
    }
}
