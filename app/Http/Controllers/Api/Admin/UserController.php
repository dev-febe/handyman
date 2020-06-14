<?php

namespace App\Http\Controllers\Api\Admin;

use Validator;
use App\Models\BankDetail;
use App\Exports\UsersExport;
use Illuminate\Http\Request;
use App\Models\Auth\Role\Role;
use App\Models\Auth\User\User;
use App\Models\ProviderProfile;
use App\Http\Controllers\Controller;
use Maatwebsite\Excel\Facades\Excel;


class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $users = User::whereRaw("1=1")->with('roles');

        if($request->email_like) {
            $users = $users->where('email', 'like', "%" . $request->email_like . "%");
        }

        if($request->name_like) {
            $users = $users->where('name', 'like', "%" . $request->name_like . "%");
        }

        if($request->role) {
            $role = $request->role;
            $users = $users->whereHas('roles', function ($query) use ($role){
                $query->where('name', $role);
            });
        }

        return response()->json($users->orderBy('created_at', 'asc')->paginate(config('constants.paginate_per_page')));
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $user = User::with('roles')->find($id);

        return response()->json($user->load('wallet')->load('bankDetail'));
    }

    /**
     * Add the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  User  $user
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|max:255',
            'email' => 'required|email|max:255|unique:users',
            'mobile_number' => 'required|unique:users',
            'image' => 'sometimes|image',
            'password' => 'required|min:6',
            'role' => 'required|array|exists:roles,id'
        ]);

        $user = User::create($request->all());
        $user->password = bcrypt($request->get('password'));
        $user->save();

        // attach role
        foreach ($request->role as $role) {
            $user->roles()->attach($role);
            if(Role::find($role)->name == 'provider') {
                ProviderProfile::create([
                    'user_id' => $user->id
                ]);
            }
        }

        return response()->json($user->load('wallet')->load('bankDetail'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  User  $user
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, User $user)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|max:255',
            'email' => 'required|email|max:255',
            'mobile_number' => 'required|max:15',
            'image' => 'sometimes|image',
            'role' => 'required|array|exists:roles,id',
            'wallet_balance' => 'numeric|nullable|min:0',
            'account_name' => 'required_with:bank_name,account_number,ifsc|string|nullable',
            'bank_name' => 'required_with:account_name,account_number,ifsc|string|nullable',
            'account_number' => 'required_with:account_name,bank_name,ifsc|string|nullable',
            'ifsc' => 'required_with:account_name,bank_name,account_number|string|nullable'
        ]);

        $validator->sometimes('email', 'unique:users', function ($input) use ($user) {
            return strtolower($input->email) != strtolower($user->email);
        });

        $validator->sometimes('mobile_number', 'unique:users', function ($input) use ($user) {
            return strtolower($input->mobile_number) != strtolower($user->mobile_number);
        });

        $validator->sometimes('password', 'min:6', function ($input) {
            return $input->password;
        });

        if ($validator->fails()) {
            return response()->json($validator->errors());
        }

        $user->name = $request->get('name');
        $user->email = $request->get('email');
        $user->mobile_number = $request->get('mobile_number');

        if ($request->has('password')) {
            $user->password = bcrypt($request->get('password'));
        }

        $user->save();

        //roles
        $user->roles()->detach();
        foreach ($request->role as $role) {
            $user->roles()->attach($role);
            if(Role::find($role)->name == 'provider') {
                if(!ProviderProfile::where('user_id', $user->id)->exists()) {
                    ProviderProfile::create([
                        'user_id' => $user->id
                    ]);
                }
            }
        }
        
        // update wallet
        $newBalance = $request->wallet_balance ? $request->wallet_balance : 0;
        $balance = $user->balance ? $user->balance : 0;
        $diff = $newBalance - $balance;
        if($diff > 0) {
            // make a deposit
            $user->deposit($diff);
        } else {
            // make a withdraw
            $user->withdraw(abs($diff));
        }

        // bank details
        if($request->account_name) {
            if($user->bankDetail) {
                $bankDetail = $user->bankDetail;
            } else {
                $bankDetail = new BankDetail();
            }
            $bankDetailsData = array_merge(["user_id" => $user->id, "name" => $request->account_name], $request->only(['bank_name', 'account_number', 'ifsc']));
            $bankDetail->fill($bankDetailsData);
            $bankDetail->save();
        } else if(!$request->account_name && $user->bankDetail) {
            $bankDetail = $user->bankDetail;
            $bankDetailsData = array_merge(["user_id" => $user->id, "name" => $request->account_name], $request->only(['bank_name', 'account_number', 'ifsc']));
            $bankDetail->fill($bankDetailsData);
            $bankDetail->save();
        }

        return response()->json($user->load('wallet')->load('bankDetail'));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  User $user
     * @return \Illuminate\Http\Response
     */
    public function destroy(User $user)
    {
        // do not allow deletion of administrator user
        if(!$user->hasRole('administrator')) {
            $user->forceDelete();
        }

        return response()->json([], 204);
    }

    public function roles()
    {
        $roles = Role::all();
        return response()->json($roles);
    }

    public function export()
    {
        return Excel::download(new UsersExport, 'users.xlsx');
    }
}
