<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\CourseLecture;
use App\Models\Course;
use App\Models\Review;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;

class ReviewController extends Controller
{
    public function StoreReview(Request $request)
    {
        $course = $request->course_id;
        $instructor = $request->instructor_id;

        $request->validate([
            'comment' => 'required'
        ]);

        Review::insert([
            'course_id' => $course,
            'user_id' => Auth::id(),
            'comment' => $request->comment,
            'rating' => $request->rate,
            'instructor_id' => $instructor,
            'created_at' => Carbon::now()
        ]);

        // Notification Function
        $notification = array(
            'message' => 'Review Will Approve By Admin!',
            'alert-type' => 'info'
        );
        return redirect()->back()->with($notification);
    }

    public function AdminPendingReview()
    {
        $review = Review::where('status', 0)->orderBy('id', 'desc')->get();

        return view('admin.backend.review.pending_review', compact('review'));
    }

    public function UpdateReviewStatus(Request $request)
    {
        $reviewId = $request->input('review_id');
        $isChecked = $request->input('is_checked', 0);

        $review = Review::find($reviewId);
        if ($review) {
            $review->status = $isChecked;
            $review->save();
        }

        return response()->json(['message' => 'Review Status Updated Succesfully']);
    }

    public function AdminActiveReview()
    {
        $review = Review::where('status', 1)->orderBy('id', 'desc')->get();

        return view('admin.backend.review.active_review', compact('review'));
    }

    public function InstructorAllReview()
    {
        $id = Auth::user()->id;
        $review = Review::where('instructor_id', $id)->where('status', 1)->orderBy('id', 'desc')->get();

        return view('instructor.review.active_review', compact('review'));
    }
}
