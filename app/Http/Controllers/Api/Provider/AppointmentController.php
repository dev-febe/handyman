<?php

namespace App\Http\Controllers\Api\Provider;

use App\Events\Auth\UpdateAppointment;
use App\Http\Controllers\Controller;
use App\Http\Requests\Api\Provider\AppointmentUpdateRequest;
use App\Models\Appointment;
use App\Models\AppointmentStatusLog;
use Illuminate\Support\Facades\Auth;

class AppointmentController extends Controller
{
    public function index()
    {
        return response()->json(Auth::user()->provider->appointments()->orderBy('date', 'desc')->paginate(config('constants.paginate_per_page')));
    }

    public function update(Appointment $appointment, AppointmentUpdateRequest $request)
    {
        $old_status = $appointment->status;
        $rescheduled = false;

        if($appointment->date != $request->date) {
            // if provider has changed the date of appointment, we consider it as reschedule
            $rescheduled = true;
        }

        $appointment->fill($request->all());
        $appointment->save();

        if($old_status != $appointment->status && $appointment->status != 'rejected') {
            AppointmentStatusLog::create([
                'user_id' => $appointment->user_id,
                'appointment_id' => $appointment->id,
                'status' => $appointment->status
            ]);
        }

        event(new UpdateAppointment($appointment, $rescheduled));

        return response()->json($appointment->refresh());
    }
}
