<?php

namespace App\Http\Controllers\Api;

use App\Models\Payout;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\ValidationException;

class PayoutController extends Controller
{
    public function index()
    {
        $payouts = Payout::where('user_id', Auth::user()->id);
        return response()->json($payouts->paginate(config('constants.paginate_per_page')));
    }

    public function store(Request $request)
    {
        $user = Auth::user();
        $request->validate([
            'amount' => 'required|numeric'
        ]);

        if(((float)$user->balance) < ((float)$request->amount)) {
            throw ValidationException::withMessages([
                'balance' => 'Insufficient funds in your wallet'
            ]);
        }

        $payout = Payout::create([
            'requested_amount' => $request->amount,
            'user_id' => $user->id
        ]);

        return response()->json($payout);
    }
}
