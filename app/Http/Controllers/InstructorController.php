<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class InstructorController extends Controller
{
    public function InstructorDashboard()
    {
        return view('instructor.index');
    }

    public function InstructorLogout(Request $request)
    {
        Auth::guard('web')->logout();

        $request->session()->invalidate();

        $request->session()->regenerateToken();

        // Notification Function
        $notification = array(
            'message' => 'Logout Successfully!',
            'alert-type' => 'success'
        );

        return redirect('/instructor/login')->with($notification);
    }

    public function InstructorLogin()
    {
        return view('instructor.instructor_login');
    }

    public function InstructorProfile()
    {
        $id = Auth::user()->id;
        $profileData = User::find($id);
        return view('instructor.instructor_profile_view', compact('profileData'));
    }

    public function InstructorProfileStore(Request $request)
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
            @unlink(public_path('upload/instructor_images/' . $data->photo));
            $filename = date('YmdHi') . $file->getClientOriginalName();
            $file->move(public_path('upload/instructor_images'), $filename);
            $data['photo'] = $filename;
        }
        // save Update
        $data->save();

        // Notification Function
        $notification = array(
            'message' => 'Instructor Profile Updated Successfully!',
            'alert-type' => 'success'
        );

        return redirect()->back()->with($notification);
    }

    // Change Password
    public function InstructorChangePassword()
    {
        $id = Auth::user()->id;
        $profileData = User::find($id);
        return view('instructor.instructor_change_password', compact('profileData'));
    }

    // Password Update
    public function InstructorPasswordUpdate(Request $request)
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
}