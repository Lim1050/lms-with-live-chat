<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    public function Index()
    {
        return view('frontend.index');
    }

    public function UserProfile()
    {
        $id = Auth::user()->id;
        $profileData = User::find($id);
        return view('frontend.dashboard.edit_profile', compact('profileData'));
    }

    public function UserProfileUpdate(Request $request)
    {
        //Update
        $id = Auth::user()->id;
        $data = User::find($id);
        $data->name = $request->name;
        $data->username = $request->username;
        $data->email = $request->email;
        $data->phone = $request->phone;
        $data->address = $request->address;

        if($request->file('photo')){
            $file = $request->file('photo');
            @unlink(public_path('upload/user_images/' . $data->photo));
            $filename = date('YmdHi') . $file->getClientOriginalName();
            $file->move(public_path('upload/user_images'), $filename);
            $data['photo'] = $filename;
        }
        // save Update
        $data->save();

        // Notification Function
        $notification = array(
            'message' => 'User Profile Updated Successfully!',
            'alert-type' => 'success'
        );

        return redirect()->back()->with($notification);
    }

    public function UserChangePassword()
    {
        return view('frontend.dashboard.change_password');
    }

    public function UserLogout(Request $request)
    {
        Auth::guard('web')->logout();

        $request->session()->invalidate();

        $request->session()->regenerateToken();

        // Notification Function
        $notification = array(
            'message' => 'Logout Successfully!',
            'alert-type' => 'success'
        );

        return redirect('/login')->with($notification);
    }

    // Password Update
    public function UserPasswordUpdate(Request $request)
    {
        // Validation
        $request->validate([
            'old_password' => 'required',
            'new_password' => 'required | confirmed'
        ]);

        if(!Hash::check($request->old_password, auth::user()->password)){
            // Notification Function
            $notification = array(
                'message' => 'Old Password Does Not Match!',
                'alert-type' => 'error'
            );
            return back()->with($notification);
        }

        // update the new password
        User::whereId(auth::user()->id)->update([
            'password' => Hash::make($request->new_password)
        ]);

        // Notification Function
            $notification = array(
                'message' => 'Password Change Successfully!',
                'alert-type' => 'success'
            );
            return back()->with($notification);

    }

    public function LiveChat()
    {
        return view('frontend.dashboard.live_chat');
    }
}
