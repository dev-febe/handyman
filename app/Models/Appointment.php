<?php

namespace App\Models;

use App\Models\Auth\User\Traits\Ables\Protectable;
use App\Models\Auth\User\Traits\Attributes\UserAttributes;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Foundation\Auth\User as Authenticatable;
use App\Models\Auth\User\Traits\Ables\Rolable;
use App\Models\Auth\User\Traits\Scopes\UserScopes;
use App\Models\Auth\User\Traits\Relations\UserRelations;
use Kyslik\ColumnSortable\Sortable;
use Laravel\Passport\HasApiTokens;

class Appointment extends Model
{
    use Sortable;

    protected $table = 'appointments';

    protected $fillable = ['date', 'address_id', 'provider_id', 'user_id', 'time_from', 'time_to', 'status'];

    protected $with = array('user', 'provider', 'logs');

    public function user()
    {
        return $this->belongsTo('App\Models\Auth\User\User', 'user_id');
    }

    public function provider()
    {
        return $this->belongsTo('App\Models\ProviderProfile', 'provider_id');
    }

    public function logs()
    {
        return $this->hasMany('App\Models\AppointmentStatusLog', 'appointment_id');
    }
}
