<?php

namespace App\Http\Controllers\Api;

use App\Models\BankDetail;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use App\Http\Requests\Api\BankDetailCreateRequest;

class BankDetailController extends Controller
{

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Store  $store
     * @return \Illuminate\Http\Response
     */
    public function show()
    {
        $bankDetail = Auth::user()->bankDetail;
        if(!$bankDetail) {
            abort(404);
        }
        return response()->json($bankDetail);
    }


    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(BankDetailCreateRequest $request)
    {
	    $requestData = $request->all();
        if(Auth::user()->bankDetail) {
            $bankDetail = Auth::user()->bankDetail;
        } else {
            $bankDetail = new BankDetail();
            $requestData['user_id'] = Auth::user()->id;
        }
        $bankDetail->fill($requestData);
        $bankDetail->save();
        return response()->json($bankDetail);
    }
}
