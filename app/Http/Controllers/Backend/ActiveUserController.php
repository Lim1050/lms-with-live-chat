<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;

class ActiveUserController extends Controller
{
    public function AllUser()
    {
        $users = User::where('role', 'user')->latest()->get();
        return view('admin.backend.user.all_user', compact('users'));
    }
    public function AllInstructor()
    {
        $users = User::where('role', 'instructor')->latest()->get();
        return view('admin.backend.user.all_instructor', compact('users'));
    }
}
