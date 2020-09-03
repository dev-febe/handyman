<?php

namespace App\Http\Controllers\Api\Customer;

use App\Models\Setting;
use App\Models\Appointment;
use App\Events\NewAppointment;
use App\Models\ProviderProfile;
use App\Events\UpdateAppointment;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\ValidationException;
use App\Http\Requests\Api\Customer\AppointmentCreateRequest;

class AppointmentController extends Controller
{
    public function index()
    {
        return response()->json(Auth::user()->appointments()->orderBy('date', 'desc')->paginate(config('constants.paginate_per_page')));
    }

    public function store(AppointmentCreateRequest $request)
    {
        $user = Auth::user();

        // calculate price
        // get price set by provider for selected category        
        $subtotal = ProviderProfile::find($request->provider_id)->subcategories()->where('id', $request->category_id)->first()->pivot->price;
        $tax_in_percent_setting = Setting::where('key', 'tax_in_percent')->first()->value;
        $tax_in_percent =  !empty($tax_in_percent_setting) ? number_format((float)$tax_in_percent_setting, 2, '.', '') : 0;
        $tax = ($subtotal*($tax_in_percent/100));
        $price = $subtotal + $tax;

        // check if user's wallet has sufficient funds
        if ($user->wallet->balance < $price) {
            throw ValidationException::withMessages([
                'balance' => 'Insufficient funds in your wallet'
            ]);
        }

        $appointment = new Appointment();
        $appointment->fill($request->all());
        $appointment->user_id = Auth::user()->id;
        $appointment->status = 'pending';

        $appointment->subtotal = $subtotal;
        $appointment->tax = $tax;
        $appointment->price = $price;

        $appointment->save();

        event(new NewAppointment($appointment));

        return response()->json(Appointment::find($appointment->id));
    }

    public function cancel(Appointment $appointment)
    {
        $appointment->status = 'cancelled';
        $appointment->save();

        event(new UpdateAppointment($appointment, false));

        return response()->json($appointment);
    }
}
