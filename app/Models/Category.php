<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Laravel\Passport\HasApiTokens;

class Category extends Model
{

    protected $table = 'categories';

    protected $fillable = ['title', 'image_url', 'parent_id'];
}
