<?php

namespace App\Http\Controllers\Api\Customer;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\Customer\RatingCreateRequest;
use App\Models\ProviderProfile;
use App\Models\Rating;
use Illuminate\Support\Facades\Auth;

class RatingController extends Controller
{
    public function index(ProviderProfile $provider)
    {
        return response()->json(Rating::where('provider_id', $provider->id)->paginate(config('constants.paginate_per_page')));
    }

    public function store(RatingCreateRequest $request, ProviderProfile $provider)
    {
        $rating = new Rating();
        $rating->fill($request->all());
        $rating->provider_id = $provider->id;
        $rating->user_id = Auth::user()->id;
        $rating->save();

        return response()->json($rating);
    }

    public function show()
    {
        $ratings = Rating::where('user_id', Auth::user()->id)->paginate(config('constants.paginate_per_page'));
        return response()->json($ratings);
    }
}
