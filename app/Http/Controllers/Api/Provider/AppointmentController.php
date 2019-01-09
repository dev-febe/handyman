<?php

namespace App\Http\Controllers\Api\Provider;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\Provider\AppointmentUpdateRequest;
use App\Models\Address;
use App\Models\Appointment;
use App\Models\AppointmentStatusLog;
use Illuminate\Support\Facades\Auth;

class AppointmentController extends Controller
{
    public function index()
    {
        return response()->json(Auth::user()->provider->appointments()->paginate(config('constants.paginate_per_page')));
    }

    public function update(Appointment $appointment, AppointmentUpdateRequest $request)
    {
        $old_status = $appointment->status;

        $appointment->fill($request->all());
        $appointment->save();

        if($old_status != $appointment->status && $appointment->status != 'rejected') {
            AppointmentStatusLog::create([
                'user_id' => $appointment->user_id,
                'appointment_id' => $appointment->id,
                'status' => $appointment->status
            ]);
        }

        return response()->json($appointment->refresh());
    }
}
