<?php

namespace App\Models;

use App\Http\Requests\Api\Customer\ProviderProfileListRequest;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;
use Laravel\Passport\HasApiTokens;
use Rinvex\Subscriptions\Traits\HasSubscriptions;

class ProviderProfile extends Model
{
    use HasSubscriptions;

    protected $table = 'provider_profiles';

    protected $fillable = ['primary_category_id', 'user_id', 'is_verified', 'document_url', 'image_url', 'price', 'price_type', 'address', 'longitude', 'latitude', 'about'];

    protected $with = array('primary_category','subcategories', 'user');

    protected $appends = array('ratings');

    public static function search($user, ProviderProfileListRequest $request)
    {
        $distanceDelta = 15000;

        $distanceSetting = Setting::where('key', 'distance_limit')->first();
        if($distanceSetting) {
            $distanceDelta = $distanceSetting->value ? (int)$distanceSetting->value : $distanceDelta;
        }

        // show providers listed with in particular distance
        $subqueryDistance = "ST_Distance_Sphere(Point(provider_profiles.longitude,"
            . " provider_profiles.latitude),"
            . " Point($request->long, $request->lat ))"
            . " as distance";

        $subqueryDistanceWhere = "ST_Distance_Sphere(Point(provider_profiles.longitude,"
            . " provider_profiles.latitude),"
            . " Point($request->long, $request->lat ))"
            . " < " . $distanceDelta;

        $providers = ProviderProfile::select('*', DB::raw($subqueryDistance))->whereRaw($subqueryDistanceWhere);

        // filter for category
        $categoryId = $request->input('category');
        $providers = $providers->whereHas('subcategories', function ($query) use ($categoryId) {
            $query->where('id', $categoryId);
        });

        $providers->get();

        return $providers;
    }

    /**
     * Calculate rating of a store
     * @return integer
     */
    public function getRatingsAttribute()
    {
        return Rating::where('provider_id', $this->attributes['id'])->get()->avg->rating;
    }

    public function user()
    {
        return $this->belongsTo('App\Models\Auth\User\User', 'user_id');
    }

    public function primary_category()
    {
        return $this->belongsTo('App\Models\Category', 'primary_category_id');
    }

    public function subcategories()
    {
        return $this->belongsToMany('App\Models\Category', 'providers_categories', 'provider_id');
    }

    public function ratings()
    {
        return $this->hasMany('App\Models\Rating', 'provider_id');
    }

    public function appointments()
    {
        return $this->hasMany('App\Models\Appointment', 'provider_id');
    }
}
