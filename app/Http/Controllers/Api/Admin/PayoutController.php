<?php

namespace App\Http\Controllers\Api\Admin;

use Validator;
use App\Models\Payout;
use App\Helpers\Language;
use App\Models\Transaction;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Helpers\PushNotificationHelper;


class PayoutController extends Controller
{
    public function index(Request $request)
    {
        $payouts = Payout::whereRaw("1=1")->with(['user.wallet', 'user.bankDetail']);

        return response()->json($payouts->orderBy('created_at', 'desc')->paginate(config('constants.paginate_per_page')));
    }

    public function show($id)
    {
        $payout = Payout::find($id)->load(['user.wallet', 'user.bankDetail']);

        return response()->json($payout);
    }

    public function update(Request $request, Payout $payout)
    {
        $request->validate([
            'amount' => 'required|numeric',
            'status' => 'required|in:pending,complete,reject'
        ]);

        // withdraw amount from user's wallet
        if($payout->status != 'complete' && $request->status == 'complete') {
            $payout->user->withdraw($request->amount);
            
            Transaction::create([
                'title' => 'Payout complete',
                'description' => 'Payout #' . $payout->id . ' complete',
                'status' => 'debit',
                'amount' => $request->amount,
                'user_id' => $payout->user_id,
                'source' => 'payout',
                'appointment_id' => null
            ]);

            $this->notifyUser($payout);
        }

        $payout->fill($request->only(['amount', 'status']));
        $payout->save();

        return response()->json($payout);
    }

    public function destroy(Payout $payout)
    {
        $payout->delete();

        return response()->json([], 204);
    }

    private function notifyUser(Payout $payout)
    {
        $notificationId = $payout->role == 'provider' ? $payout->user->fcm_registration_id_provider : $payout->user->fcm_registration_id;
        if($notificationId) {
            $oneSignal = PushNotificationHelper::getOneSignalInstance();
            $language = new Language($payout->user->language);
            $oneSignal->sendNotificationToUser($language->get('payout_complete_title'),
                $this->appointment->user->fcm_registration_id,
                null,
                ["title" => $language->get('payout_complete_title'), "body" => $language->get('payout_complete_body'), "payout_id" => $payout->id]);
        }
    }
}
