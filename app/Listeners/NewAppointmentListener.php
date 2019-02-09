<?php

namespace App\Listeners\Auth;

use App\Events\NewAppointment;
use App\Helpers\PushNotificationHelper;
use Illuminate\Support\Facades\Log;


class NewAppointmentListener
{
    private $event;
    private $appointment;

    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     *
     * @param  NewAppointment $event
     * @return void
     */
    public function handle(NewAppointment $event)
    {
        try {
            $this->event = $event;
            $this->appointment = $event->appointment;

            if($this->appointment->provider->user->fcm_registration_id) {
                OneSignal::send('New Appointment',
                    $this->appointment->provider->user->fcm_registration_id,
                    'You have recieved new appointment for service',
                    ["title" => "New Appointment", "body" => 'You have recieved new appointment for service', "appoinment_id" => $this->appointment->id]);
            }

        } catch (\Exception $ex) {
            Log::error('Exception: Notification not sent', [$ex->getMessage(), $ex->getTraceAsString()]);
        }
    }
}
