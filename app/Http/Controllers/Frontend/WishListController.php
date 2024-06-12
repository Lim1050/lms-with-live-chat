<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Wishlist;
use Illuminate\Http\Request;
use App\Models\CourseLecture;
use App\Models\CourseSection;
use App\Models\Category;
use App\Models\SubCategory;
use App\Models\Course;
use App\Models\Course_goal;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Intervention\Image\ImageManager;
use Intervention\Image\Drivers\Gd\Driver;

class WishlistController extends Controller
{
    public function AddToWishList(Request $request, $course_id)
    {
        if (Auth::check()) {
            $exists = Wishlist::where('user_id', Auth::id())->where('course_id', $course_id)->first();

            if (!$exists) {
                Wishlist::insert([
                    'user_id' => Auth::id(),
                    'course_id' => $course_id,
                    'created_at' => Carbon::now()
                ]);
                return response()->json(['success' => 'Successfully Added on Your Wishlist!']);
            }else {
                return response()->json(['error' => 'This Course Has Already on Your Wishlist!']);
            }
        }else {
            return response()->json(['error' => 'At First Login Your Account!']);
        }
    }

    public function AllWishList()
    {
        return view('frontend.wishlist.all_wishlist');
    }

    public function GetWishlistCourse()
    {
        $wishlist = Wishlist::with('course')->where('user_id', Auth::id())->latest()->get();

        $wishQty = Wishlist::count();

        return response()->json([
            'wishlist' => $wishlist,
            'wishQty' => $wishQty
        ]);
    }

    public function RemoveWishlist($id)
    {
        Wishlist::where('user_id', Auth::id())->where('id', $id)->delete();
        return response()->json(['success' => 'Course Successfully Removed!']);
    }
}
