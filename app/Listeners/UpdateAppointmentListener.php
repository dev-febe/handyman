<?php

namespace App\Listeners\Auth;

use OneSignal;
use App\Events\UpdateAppointment;
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
    public function handle(UpdateAppointment $event)
    {
        try {
            $this->event = $event;
            $this->appointment = $event->appointment;
            $this->rescheduled = $event->rescheduled;

            if($this->rescheduled) {
                // send notification to user
                if($this->appointment->user->fcm_registration_id) {
                    OneSignal::sendNotificationToUser('Appointment Rescheduled',
                        $this->appointment->user->fcm_registration_id,
                        'Your appointment with provider is rescheduled',
                        ["title" => "Appointment Rescheduled", "body" => 'Your appointment with provider is rescheduled', "appoinment_id" => $this->appointment->id]);
                }
            } else if($this->appointment->status == "cancelled") {
                if($this->appointment->provider->user->fcm_registration_id) {
                    // send notification to provider
                    OneSignal::sendNotificationToUser('Appointment Cancelled',
                        $this->appointment->provider->user->fcm_registration_id,
                        'Client has cancelled the appointment',
                        ["title" => "Appointment Cancelled", "body" => 'Client has cancelled the appointment', "appoinment_id" => $this->appointment->id]);
                }
            } else if($this->appointment->status == "rejected") {
                // send notification to user
                if($this->appointment->user->fcm_registration_id) {
                    OneSignal::sendNotificationToUser('Appointment Rejected',
                        $this->appointment->user->fcm_registration_id,
                        'Provider has rejected the appointment',
                        ["title" => "Appointment Rejected", "body" => 'Provider has rejected the appointment', "appoinment_id" => $this->appointment->id]);
                }
            } else if($this->appointment->status == "accepted") {
                // send notification to user
                if($this->appointment->user->fcm_registration_id) {
                    OneSignal::sendNotificationToUser('Appointment Accepted',
                        $this->appointment->user->fcm_registration_id,
                        'Provider has accepted the appointment',
                        ["title" => "Appointment Accepted", "body" => 'Provider has accepted the appointment', "appoinment_id" => $this->appointment->id]);
                }
            } else if($this->appointment->status == "ongoing") {
                // send notification to user
                if($this->appointment->user->fcm_registration_id) {
                    OneSignal::sendNotificationToUser('Appointment Started',
                        $this->appointment->user->fcm_registration_id,
                        'Provider has started the appointmen',
                        ["title" => "Appointment Started", "body" => 'Provider has started the appointment', "appoinment_id" => $this->appointment->id]);
                }
            } else if($this->appointment->status == "complete") {
                // send notification to user
                if($this->appointment->user->fcm_registration_id) {
                    OneSignal::sendNotificationToUser('Appointment Complete',
                        $this->appointment->user->fcm_registration_id,
                        'Your appointment with provider is complete',
                        ["title" => "Appointment Complete", "body" => 'Your appointment with provider is complete', "appoinment_id" => $this->appointment->id]);
                }
            }

        } catch (\Exception $ex) {
            Log::error('Exception: Notification not sent', [$ex->getMessage(), $ex->getTraceAsString()]);
        }
    }
}
