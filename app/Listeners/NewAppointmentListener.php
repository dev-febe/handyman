<?php

namespace App\Listeners\Auth;

use OneSignal;
use App\Helpers\Language;
use App\Models\Transaction;
use App\Events\NewAppointment;
use Illuminate\Support\Facades\Log;
use App\Helpers\PushNotificationHelper;


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

            // deduct balance from user wallet
            $this->appointment->user->withdraw($this->appointment->price);

            // create a transaction
            Transaction::create([
                'title' => 'Appointment Payment',
                'description' => 'Amount deducted for appointment #' . $this->appointment->id,
                'status' => 'debit',
                'amount' => $this->appointment->price,
                'user_id' => $this->appointment->user_id,
                'source' => 'appointment',
                'appointment_id' => $this->appointment->id
            ]);

            if($this->appointment->provider->user->fcm_registration_id_provider) {

                $languageCode = $this->appointment->provider->user->language;
                $language = new Language($languageCode);

                $oneSignal = PushNotificationHelper::getOneSignalInstance("provider");
                $oneSignal->sendNotificationToUser($language->get('appointment_new_title'),
                    $this->appointment->provider->user->fcm_registration_id_provider,
                    null,
                    ["title" => $language->get('appointment_new_title'), "body" => $language->get('appointment_new_body'), "appoinment_id" => $this->appointment->id]);
            }

        } catch (\Exception $ex) {
            Log::error('Exception: Notification not sent', [$ex->getMessage(), $ex->getTraceAsString()]);
        }
    }
}
