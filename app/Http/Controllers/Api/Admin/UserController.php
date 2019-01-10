<?php

namespace App\Http\Controllers\Api\Admin;

use App\Events\Auth\Registered;
use App\Http\Controllers\Controller;
use App\Models\Auth\Role\Role;
use App\Models\Auth\User\User;
use Illuminate\Http\Request;
use Validator;


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

        return response()->json($user);
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
            'role' => 'required|exists:roles,id'
        ]);

        $user = User::create($request->all());

        // attach role
        $user->roles()->attach($request->role);

        event(new Registered($user, Role::find($request->role)->name));

        return response()->json($user);
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
            'image' => 'sometimes|image'
        ]);

        $validator->sometimes('email', 'unique:users', function ($input) use ($user) {
            return strtolower($input->email) != strtolower($user->email);
        });

        $validator->sometimes('password', 'min:6|confirmed', function ($input) {
            return $input->password;
        });

        if ($validator->fails()) {
            return response()->json($validator->errors());
        }

        $user->name = $request->get('name');
        $user->email = $request->get('email');

        if ($request->has('password')) {
            $user->password = bcrypt($request->get('password'));
        }

        $user->save();

        //roles
        if ($request->has('roles')) {
            $user->roles()->detach();

            if ($request->get('roles')) {
                $user->roles()->attach($request->get('roles'));
            }
        }

        return response()->json($user);
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
}
