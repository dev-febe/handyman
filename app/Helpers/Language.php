<?php

namespace App\Helpers;

class Language
{
    private $languageCode;

    private $dictionary = [
        "en" => [
            "appointment_new_title" => "New Appointment",
            "appointment_new_body" => "You have recieved new appointment for service",
            "appointment_rescheduled_title" => "Appointment Rescheduled",
            "appointment_rescheduled_body" => "Your appointment with provider is rescheduled",
            "appointment_cancelled_title" => "Appointment Cancelled",
            "appointment_cancelled_body" => "Client has cancelled the appointment",
            "appointment_rejected_title" => "Appointment Rejected",
            "appointment_rejected_body" => "Provider has rejected the appointment",
            "appointment_accepted_title" => "Appointment Accepted",
            "appointment_accepted_body" => "Provider has accepted the appointment",
            "appointment_ongoing_title" => "Appointment Started",
            "appointment_ongoing_body" => "Provider has started the appointment",
            "appointment_complete_title" => "Appointment Complete",
            "appointment_complete_body" => "Your appointment with provider is complete",
        ],
        "es" => [
            "bus" => "Bus",
            "from" => "desde",
            "at" => "a",
            "picked_from_school" => "Se ha recogido del Colegio",
            "picked_from_home" => "Se ha recogido de la Casa",
            "dropped_at_home" => "Llego a la Casa",
            "dropped_at_school" => "Llego al Colegio",
            "pickup" => "Recoger",
            "dropped" => "Entregar",
            "picked" => "Recogido"
        ],
        "ar" => [
            "bus" => "نقل",
            "from" => "من",
            "at" => "عند",
            "picked_from_school" => "تم احضاره من المدرسة",
            "picked_from_home" => "تم احضاره من المدرسة",
            "dropped_at_home" => "تم ايصاله للمنزل",
            "dropped_at_school" => "تم ايصاله للمدرسة",
            "pickup" => "نقطة التقاء",
            "dropped" => "نقطة وصول",
            "picked" => "تم احضاره"
        ],
    ];

    public function __construct($languageCode)
    {
        $this->languageCode = $languageCode ? $languageCode : "en";
    }

    public function get($key)
    {
        $languageCode = array_key_exists($this->languageCode, $this->dictionary) ? $this->languageCode : "en";
        return $this->dictionary[$languageCode][$key];
    }
}