<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Laravel\Passport\HasApiTokens;

class Payout extends Model
{

    protected $table = 'payouts';

    protected $fillable = ['user_id', 'requested_amount', 'amount', 'status'];

    protected $casts = [
        'requested_amount' => 'float',
        'amount' => 'float'
    ];

    protected $with = ['user'];

    public function user()
    {
        return $this->belongsTo('App\Models\Auth\User\User', 'user_id');
    }
}
