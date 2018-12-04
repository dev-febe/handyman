<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Laravel\Passport\HasApiTokens;

/**
 * @property  string title
 * @property  string address
 * @property  double latitude
 * @property  double longitude
 * @property  integer user_id
 */
class Address extends Model
{

    protected $table = 'addresses';

    protected $fillable = ['title', 'address', 'latitude', 'longitude'];

    public function user()
    {
        return $this->belongsTo('App\Models\Auth\User\User', 'user_id');
    }
}
