<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Laravel\Passport\HasApiTokens;

class Transaction extends Model
{

    protected $table = 'transactions';

    protected $fillable = ['title', 'description', 'status', 'amount', 'user_id', 'is_paid',
        'source', 'image_url', 'appointment_id'];

    protected $with = array('user', 'appointment');

    public function user()
    {
        return $this->belongsTo('App\Models\Auth\User\User', 'user_id');
    }

    public function appointment()
    {
        return $this->belongsTo('App\Models\Appointment', 'aapointment_id');
    }
}