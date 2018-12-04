<?php

namespace App\Http\Controllers\Api\Customer;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\Customer\RatingCreateRequest;
use App\Http\Requests\Api\Customer\ProviderProfileListRequest;
use App\Models\ProviderProfile;
use App\Models\Rating;
use Illuminate\Support\Facades\Auth;

class ProviderController extends Controller
{
    public function index(ProviderProfileListRequest $request)
    {
        return response()->json(ProviderProfile::search(Auth::user(), $request)->paginate(config('constants.paginate_per_page')));
    }

    public function show(ProviderProfile $provider)
    {
        return response()->json($provider);
    }

    public function ratings(ProviderProfile $provider)
    {
        return response()->json($provider->ratings()->paginate(config('constants.paginate_per_page')));
    }

    public function rate(ProviderProfile $provider, RatingCreateRequest $request)
    {
        $rating = new Rating();
        $rating->fill($request->all());
        $rating->provider_id = $provider->id;
        $rating->user_id = Auth::user()->id;
        $rating->save();
        return response()->json($rating);
    }
}
