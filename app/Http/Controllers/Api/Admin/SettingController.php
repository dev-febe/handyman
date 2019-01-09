<?php

namespace App\Http\Controllers\Api\Admin;

use App\Models\Setting;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class SettingController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @param Request $request
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        return response()->json(Setting::all());
    }

    public function update(Request $request)
    {
        $inputs = $request->all();

        foreach ($inputs as $key => $value) {
            try {
                $setting = Setting::where('key', $key)->firstOrFail();
                $setting->value = $value;
                $setting->save();
            } catch (ModelNotFoundException $ex) {
                //
            }
        }

        return response()->json([]);
    }
}
