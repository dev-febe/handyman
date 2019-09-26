<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\ApiStoreUpdateRequest;
use App\Models\Store;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class UserController extends Controller
{
    /**
     * Display the store of current logged in user
     *
     * @return \Illuminate\Http\Response
     */
    public function show()
    {
        return response()->json(Auth::user());
    }


    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request)
    {
        $user = Auth::user();

        if($request->fcm_registration_id) {
            $user->fcm_registration_id = $request->fcm_registration_id;
        }

        if($request->image_url) {
            $user->image_url = $request->image_url;
        }

        if($request->language) {
            $user->language = $request->language;
        }

        $user->save();

        return response()->json($user);
    }
}
