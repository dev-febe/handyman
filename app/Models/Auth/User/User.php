<?php

namespace App\Models\Auth\User;

use Depsimon\Wallet\HasWallet;
use Laravel\Passport\HasApiTokens;
use Kyslik\ColumnSortable\Sortable;
use Rennokki\Plans\Traits\HasPlans;
use Illuminate\Notifications\Notifiable;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Models\Auth\User\Traits\Ables\Rolable;
use App\Models\Auth\User\Traits\Ables\Protectable;
use App\Models\Auth\User\Traits\Scopes\UserScopes;
use Illuminate\Foundation\Auth\User as Authenticatable;
use App\Models\Auth\User\Traits\Relations\UserRelations;
use App\Models\Auth\User\Traits\Attributes\UserAttributes;

/**
 * App\Models\Auth\User\User
 *
 * @property int $id
 * @property string $name
 * @property string $email
 * @property string $password
 * @property bool $active
 * @property string $confirmation_code
 * @property bool $confirmed
 * @property string $remember_token
 * @property \Carbon\Carbon $created_at
 * @property \Carbon\Carbon $updated_at
 * @property \Carbon\Carbon $deleted_at
 * @property-read mixed $avatar
 * @property-read mixed $licensee_name
 * @property-read mixed $licensee_number
 * @property-read \Illuminate\Notifications\DatabaseNotificationCollection|\Illuminate\Notifications\DatabaseNotification[] $notifications
 * @property-read \Illuminate\Database\Eloquent\Collection|\App\Models\Protection\ProtectionShopToken[] $protectionShopTokens
 * @property-read \App\Models\Protection\ProtectionValidation $protectionValidation
 * @property-read \Illuminate\Database\Eloquent\Collection|\App\Models\Auth\User\SocialAccount[] $providers
 * @property-read \Illuminate\Database\Eloquent\Collection|\App\Models\Auth\Role\Role[] $roles
 * @method static \Illuminate\Database\Query\Builder|\App\Models\Auth\User\User sortable($defaultSortParameters = null)
 * @method static \Illuminate\Database\Query\Builder|\App\Models\Auth\User\User whereActive($value)
 * @method static \Illuminate\Database\Query\Builder|\App\Models\Auth\User\User whereConfirmationCode($value)
 * @method static \Illuminate\Database\Query\Builder|\App\Models\Auth\User\User whereConfirmed($value)
 * @method static \Illuminate\Database\Query\Builder|\App\Models\Auth\User\User whereCreatedAt($value)
 * @method static \Illuminate\Database\Query\Builder|\App\Models\Auth\User\User whereDeletedAt($value)
 * @method static \Illuminate\Database\Query\Builder|\App\Models\Auth\User\User whereEmail($value)
 * @method static \Illuminate\Database\Query\Builder|\App\Models\Auth\User\User whereId($value)
 * @method static \Illuminate\Database\Query\Builder|\App\Models\Auth\User\User whereName($value)
 * @method static \Illuminate\Database\Query\Builder|\App\Models\Auth\User\User wherePassword($value)
 * @method static \Illuminate\Database\Query\Builder|\App\Models\Auth\User\User whereRememberToken($value)
 * @method static \Illuminate\Database\Query\Builder|\App\Models\Auth\User\User whereRole($role)
 * @method static \Illuminate\Database\Query\Builder|\App\Models\Auth\User\User whereUpdatedAt($value)
 * @mixin \Eloquent
 */
class User extends Authenticatable
{
    use Rolable,
        UserAttributes,
        UserScopes,
        UserRelations,
        Notifiable,
        SoftDeletes,
        Sortable,
        HasApiTokens,
        Protectable,
        HasPlans,
        HasWallet;

    public $sortable = ['name', 'email', 'created_at', 'updated_at'];

    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'users';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['name', 'email', 'password', 'active', 'confirmation_code', 'confirmed',
        'mobile_number', 'otp_code', 'mobile_verified', 'fcm_registration_id', 'image_url',
        'language', 'fcm_registration_id_provider'];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = ['password', 'remember_token'];

    /**
     * The attributes that should be mutated to dates.
     *
     * @var array
     */
    protected $dates = ['deleted_at'];

    public static function boot() {
        parent::boot();

        //while creating/inserting item into db
        static::creating(function (User $user) {
            $code = null;
            while(1) {
                $code = generate_numeric_otp(6);
                if(!User::where('refer_code', $code)->exists()) {
                    break;
                }
            }
            $user->refer_code = $code;
        });

    }

    public function addresses()
    {
        return $this->hasMany('App\Models\Address');
    }

    /**
     * Get the provider profile record associated with the user
     */
    public function provider()
    {
        return $this->hasOne('App\Models\ProviderProfile', 'user_id');
    }

    /**
     * Get the appointments associated with the user
     */
    public function appointments()
    {
        return $this->hasMany('App\Models\Appointment', 'user_id');
    }

    /**
     * Get the bank detail associated with the user
     */
    public function bankDetail()
    {
        return $this->hasOne('App\Models\BankDetail', 'user_id');
    }
}
