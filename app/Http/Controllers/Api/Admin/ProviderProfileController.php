<?php

namespace App\Http\Controllers\Api\Admin;

use App\Http\Controllers\Controller;
use App\Models\ProviderProfile;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class ProviderProfileController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $providerProfiles = ProviderProfile::whereRaw("1=1");        

        return response()->json($providerProfiles->orderBy('created_at', 'desc')->paginate(config('constants.paginate_per_page')));
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $providerProfile = ProviderProfile::find($id);

        return response()->json($providerProfile);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  ProviderProfile $providerProfile
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, ProviderProfile $providerProfile)
    {
        $request->validate([
            'is_verified' => 'required|boolean',
            'primary_category_id' => 'required|exists:categories,id',
            'document' => 'sometimes|file',
            'image' => 'sometimes|file',
            'about' => 'required|string',
            'price' => 'required|numeric',
            'price_type' => 'required|in:visit,hour',
            'address' => 'required|string',
            'latitude' => 'required|numeric',
            'longitude' => 'required|numeric',
            'sub_categories' => 'required|array|exists:categories,id',
        ]);

        $providerProfile->fill($request->all());

        if($request->image) {
            $path = $request->file('image')->store('uploads');
            $providerProfile->image_url = Storage::url($path);
        }

        if($request->document) {
            $path = $request->file('document')->store('uploads');
            $providerProfile->document_url = Storage::url($path);
        }

        $providerProfile->save();

        return response()->json($providerProfile);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $providerProfile = ProviderProfile::find($id);
        $providerProfile->delete();

        return response()->json([], 204);
    }
}
