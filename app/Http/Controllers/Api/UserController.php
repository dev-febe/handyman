<?php

namespace App\Http\Controllers\Api;

use App\Models\Setting;
use App\Helpers\Language;
use App\Models\Transaction;
use Illuminate\Http\Request;
use App\Models\Auth\User\User;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use App\Helpers\PushNotificationHelper;
use App\Http\Requests\Api\ReferRequest;

class UserController extends Controller
{
    /**
    * Display the store of current logged in user
    *
    * @return \Illuminate\Http\Response
    */
    public function show()
    {
        return response()->json(Auth::user()->load('wallet'));
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
        
        if($request->fcm_registration_id_provider) {
            $user->fcm_registration_id_provider = $request->fcm_registration_id_provider;
        }
        
        if($request->image_url) {
            $user->image_url = $request->image_url;
        }
        
        if($request->language) {
            $user->language = $request->language;
        }
        
        $user->save();
        
        return response()->json($user->load('wallet'));
    }

    public function refer(ReferRequest $request)
    {
        // check if user has already used the referral code
        if(DB::table('refer')->where('user_id', Auth::user()->id)->exists()) {
            return response()->json(["message" => "Already referred"], 403);
        }

        // check if user is not referring himself
        if(Auth::user()->refer_code == $request->code) {
            return response()->json(["message" => "You cannot refer yourself"], 403);
        }

        // get the referrer user
        $referrer = User::where('refer_code', $request->code)->firstOrFail();

        // get the referral amount
        $refererAmountSetting = Setting::where('key', 'referer_amount')->firstOrFail();
        $refererAmount = $refererAmountSetting->value ? $refererAmountSetting->value : 0;

        $referredAmountSetting = Setting::where('key', 'referred_amount')->firstOrFail();
        $referredAmount = $referredAmountSetting->value ? $referredAmountSetting->value : 0;

        DB::table('refer')->insert(["referrer" => $referrer->id, "user_id" => Auth::user()->id]);

        // credit the amount to referrer
        $referrer->deposit($refererAmount);

        // create a transaction for refrrer
        Transaction::create([
            'title' => 'Referral Reward',
            'description' => 'Amount added for referral',
            'status' => 'credit',
            'amount' => $refererAmount,
            'user_id' => $referrer->id,
            'source' => 'refer'
        ]);

        // credit the amount to user
        Auth::user()->deposit($referredAmount);

        // create a transaction for user
        Transaction::create([
            'title' => 'Referral Reward',
            'description' => 'Amount added for referral',
            'status' => 'credit',
            'amount' => $referredAmount,
            'user_id' => Auth::user()->id,
            'source' => 'refer'
        ]);

        return response()->json(["message" => "Referal Successfull"], 200);
    }
    
    public function pushNotification(Request $request)
    {
        $request->validate([
            "role" => "required|in:customer,provider",
            "user_id" => "required|exists:users,id"
        ]);
        
        $notifyingUser = Auth::user();
        $notifiedUser = User::find($request->user_id);

        $playerId = $request->role == "customer" ? $notifiedUser->fcm_registration_id : $notifiedUser->fcm_registration_id_provider;

        $languageCode = $notifiedUser->language;
        $language = new Language($languageCode);
        
        $oneSignal = PushNotificationHelper::getOneSignalInstance($request->role);
        $oneSignal->sendNotificationToUser(
            $language->get('chat_new_message'),
            $playerId,
            null,
            ["title" => $language->get('chat_new_message'), "body" => $language->get('chat_new_body') . $notifyingUser->name]
        );

        return response()->json([], 200);
    }
}
