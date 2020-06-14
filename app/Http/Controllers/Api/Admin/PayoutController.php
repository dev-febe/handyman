<?php

namespace App\Http\Controllers\Api\Admin;

use App\Http\Controllers\Controller;
use App\Models\Payout;
use Illuminate\Http\Request;
use Validator;


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
}
