<?php

namespace App\Listeners\Auth;

use App\Events\Auth\NewAppointment;
use App\Helpers\PushNotificationHelper;
use Illuminate\Support\Facades\Log;


class UpdateAppointmentListener
{
    private $event;
    private $appointment;
    private $rescheduled;

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
            $this->rescheduled = $event->rescheduled;

            if($this->rescheduled) {
                // send notification to user
                if($this->appointment->user->fcm_registration_id) {
                    PushNotificationHelper::send($this->appointment->provider->user->fcm_registration_id,
                        'Appointment Rescheduled',
                        'Your appointment with provider is rescheduled',
                        ["appoinment_id" => $this->appointment->id]);
                }
            } else if($this->appointment->status == "cancelled") {
                if($this->appointment->provider->user->fcm_registration_id) {
                    // send notification to provider
                    PushNotificationHelper::send($this->appointment->provider->user->fcm_registration_id,
                        'Appointment Cancelled',
                        'Client has cancelled the appointment',
                        ["appoinment_id" => $this->appointment->id]);
                }
            } else if($this->appointment->status == "rejected") {
                // send notification to user
                if($this->appointment->user->fcm_registration_id) {
                    PushNotificationHelper::send($this->appointment->provider->user->fcm_registration_id,
                        'Appointment Rejected',
                        'Provider has rejected the appointment',
                        ["appoinment_id" => $this->appointment->id]);
                }
            } else if($this->appointment->status == "accepted") {
                // send notification to user
                if($this->appointment->user->fcm_registration_id) {
                    PushNotificationHelper::send($this->appointment->provider->user->fcm_registration_id,
                        'Appointment Accepted',
                        'Provider has accepted the appointment',
                        ["appoinment_id" => $this->appointment->id]);
                }
            } else if($this->appointment->status == "ongoing") {
                // send notification to user
                if($this->appointment->user->fcm_registration_id) {
                    PushNotificationHelper::send($this->appointment->provider->user->fcm_registration_id,
                        'Appointment Started',
                        'Provider has started the appointment',
                        ["appoinment_id" => $this->appointment->id]);
                }
            } else if($this->appointment->status == "complete") {
                // send notification to user
                if($this->appointment->user->fcm_registration_id) {
                    PushNotificationHelper::send($this->appointment->provider->user->fcm_registration_id,
                        'Appointment Complete',
                        'Your appointment with provider is complete',
                        ["appoinment_id" => $this->appointment->id]);
                }
            }

        } catch (\Exception $ex) {
            Log::error('Exception: Notification not sent', [$ex->getMessage(), $ex->getTraceAsString()]);
        }
    }
}
