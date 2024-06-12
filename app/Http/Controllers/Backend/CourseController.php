<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Models\CourseLecture;
use App\Models\CourseSection;
use Illuminate\Http\Request;
use App\Models\Category;
use App\Models\SubCategory;
use App\Models\Course;
use App\Models\Course_goal;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Intervention\Image\ImageManager;
use Intervention\Image\Drivers\Gd\Driver;



class CourseController extends Controller
{
    public function AllCourse()
    {
        $id = Auth::user()->id;
        $courses = Course::where('instructor_id', $id)->orderBy('id', 'desc')->get();

        return view('instructor.courses.all_course', compact('courses'));
    }

    public function AddCourse()
    {
        $categories = Category::latest()->get();

        return view('instructor.courses.add_course', compact('categories'));
    }

    public function GetSubCategory($category_id)
    {
        $subcat = SubCategory::where('category_id', $category_id)->orderBy('subcategory_name', 'ASC')->get();
        return json_encode($subcat);
    }

    public function StoreCourse(Request $request)
    {
        $request->validate([
            'video' => 'required|mimes:mp4|max:10000',
        ]);

        // Save Image
        $image = $request->file('course_image');
        $manager = new ImageManager(new Driver());
        $name_gen = hexdec(uniqid()) . '.' . $image->getClientOriginalExtension();
        $img = $manager->read($image);
        $img = $img->resize(370, 246);
        $img->toJpeg(80)->save(base_path('public/upload/course/thumbnail/' . $name_gen));
        $save_url = 'upload/course/thumbnail/' . $name_gen;

        // Save Video
        $video = $request->file('video');
        $videoName = time() . '.' . $video->getClientOriginalExtension();
        $video->move(public_path('upload/course/video/'), $videoName);
        $save_video = 'upload/course/video/' . $videoName;

        // Send data to Course Table
        $course_id = Course::insertGetId([

            'category_id' => $request->category_id,
            'subcategory_id' => $request->subcategory_id,
            'instructor_id' => Auth::user()->id,
            'course_title' => $request->course_title,
            'course_name' => $request->course_name,
            'course_name_slug' => strtolower(str_replace(' ', '-', $request->course_name)),
            'description' => $request->description,
            'video' => $save_video,

            'label' => $request->label,
            'duration' => $request->duration,
            'resources' => $request->resources,
            'certificate' => $request->certificate,
            'selling_price' => $request->selling_price,
            'discount_price' => $request->discount_price,
            'prerequisites' => $request->prerequisites,

            'bestseller' => $request->bestseller,
            'feature' => $request->featured,
            'highestrated' => $request->highestrated,
            'status' => 1,
            'course_image' => $save_url,
            'created_at' => Carbon::now(),

        ]);

        // Send data to Course Goals Table
        $goals = Count($request->course_goals);
        if ($goals != NULL) {
            for ($i=0; $i < $goals; $i++) {
                $gcount = new Course_goal();
                $gcount->course_id = $course_id;
                $gcount->goal_name = $request->course_goals[$i];
                $gcount->save();
            }
        }

        // notification
        $notification = array(
            'message' => 'Course Inserted Successfully!',
            'alert-type' => 'success'
        );
        return redirect()->route('all.course')->with($notification);
    }

    public function EditCourse($id)
    {
        $course = Course::find($id);
        $goals = Course_goal::where('course_id', $id)->get();
        $categories = Category::latest()->get();
        $subcategories = SubCategory::latest()->get();
        return view('instructor.courses.edit_course', compact('course', 'categories', 'subcategories', 'goals'));
    }

    public function UpdateCourse(Request $request)
    {
        $cid = $request->course_id;

        // Send data to Course Table
        Course::find($cid)->update([
            'category_id' => $request->category_id,
            'subcategory_id' => $request->subcategory_id,
            'instructor_id' => Auth::user()->id,
            'course_title' => $request->course_title,
            'course_name' => $request->course_name,
            'course_name_slug' => strtolower(str_replace(' ', '-', $request->course_name)),
            'description' => $request->description,

            'label' => $request->label,
            'duration' => $request->duration,
            'resources' => $request->resources,
            'certificate' => $request->certificate,
            'selling_price' => $request->selling_price,
            'discount_price' => $request->discount_price,
            'prerequisites' => $request->prerequisites,

            'bestseller' => $request->bestseller,
            'feature' => $request->featured,
            'highestrated' => $request->highestrated,

        ]);

        // notification
        $notification = array(
            'message' => 'Course Updated Successfully!',
            'alert-type' => 'success'
        );
        return redirect()->route('all.course')->with($notification);
    }

    public function UpdateCourseImage(Request $request)
    {
        $course_id = $request->id;
        $old_Image = $request->old_img;

        // Save Image
        $image = $request->file('course_image');
        $manager = new ImageManager(new Driver());
        $name_gen = hexdec(uniqid()) . '.' . $image->getClientOriginalExtension();
        $img = $manager->read($image);
        $img = $img->resize(370, 246);
        $img->toJpeg(80)->save(base_path('public\upload\course\thumbnail' . $name_gen));
        $save_url = 'upload\course\thumbnail' . $name_gen;

        if (file_exists($old_Image)){
            unlink($old_Image);
        }

        Course::find($course_id)->update([
            'course_image' => $save_url,
            'updated_at' => Carbon::now(),
        ]);

        // notification
        $notification = array(
            'message' => 'Course Image Updated Successfully!',
            'alert-type' => 'success'
        );
        return redirect()->back()->with($notification);
    }

    public function UpdateCourseVideo(Request $request)
    {
        $course_id = $request->vid;
        $oldVideo = $request->old_vid;

        // Save Video
        $video = $request->file('video');
        $videoName = time() . '.' . $video->getClientOriginalExtension();
        $video->move(public_path('upload/course/video/'), $videoName);
        $save_video = 'upload/course/video/' . $videoName;

        if (file_exists($oldVideo)){
            unlink($oldVideo);
        }

        Course::find($course_id)->update([
            'video' => $save_video,
            'updated_at' => Carbon::now(),
        ]);

        // notification
        $notification = array(
            'message' => 'Course Video Updated Successfully!',
            'alert-type' => 'success'
        );
        return redirect()->back()->with($notification);
    }

    public function UpdateCourseGoal(Request $request)
    {
        $cid = $request->id;

        if ($request->course_goals == NULL) {
            return redirect()->back();
        } else {
            Course_goal::where('course_id', $cid)->delete();

            // Send data to Course Goals Table
            $goals = Count($request->course_goals);
            for ($i=0; $i < $goals; $i++) {
                $gcount = new Course_goal();
                $gcount->course_id = $cid;
                $gcount->goal_name = $request->course_goals[$i];
                $gcount->save();
            }
        }

        // notification
        $notification = array(
            'message' => 'Course Goals Updated Successfully!',
            'alert-type' => 'success'
        );
        return redirect()->back()->with($notification);
    }

    public function DeleteCourse($id)
    {
        $course = Course::find($id);

        // delete file
        unlink($course->course_image);
        unlink($course->video);

        // delete from courses table
        Course::find($id)->delete();

        // delete from course goals table
        $goalsData = Course_goal::where('course_id', $id)->get();
        foreach($goalsData as $item){
            $item->goal_name;
            Course_goal::where('course_id', $id)->delete();
        }

        // notification
        $notification = array(
            'message' => 'Course Deleted Successfully!',
            'alert-type' => 'success'
        );
        return redirect()->back()->with($notification);
    }

    public function AddCourseLecture($id)
    {
        $course = Course::find($id);

        $section = CourseSection::where('course_id', $id)->latest()->get();

        return view('instructor.courses.section.add_course_lecture', compact('course', 'section'));
    }

    public function AddCourseSection(Request $request)
    {
        $cid = $request->id;

        // Insert into Course Section Table
        CourseSection::insert([
            'course_id' => $cid,
            'section_title' => $request->section_title
        ]);

        // notification
        $notification = array(
            'message' => 'Course Section Added Successfully!',
            'alert-type' => 'success'
        );
        return redirect()->back()->with($notification);
    }

    public function SaveLecture(Request $request)
    {
        $lecture = new CourseLecture();
        $lecture->course_id = $request->course_id;
        $lecture->section_id = $request->section_id;
        $lecture->lecture_title = $request->lecture_title;
        $lecture->url = $request->lecture_url;
        $lecture->content = $request->content;
        $lecture->save();

        return response()->json(['success' => 'Lecture Saved Successfully!']);
    }

    public function EditLecture($id)
    {
        $clecture = CourseLecture::find($id);
        return view('instructor.courses.lecture.edit_course_lecture', compact('clecture'));
    }

    public function UpdateCourseLecture(Request $request)
    {
        $lid = $request->id;

        // update Course Lecture
        CourseLecture::find($lid)->update([
            'lecture_title' => $request->lecture_title,
            'url' => $request->url,
            'content' => $request->content,
        ]);

        // notification
        $notification = array(
            'message' => 'Course Lecture Updated Successfully!',
            'alert-type' => 'success'
        );
        return redirect()->back()->with($notification);
    }

    public function DeleteLecture($id)
    {
        CourseLecture::find($id)->delete();

        // notification
        $notification = array(
            'message' => 'Course Lecture Deleted Successfully!',
            'alert-type' => 'success'
        );
        return redirect()->back()->with($notification);
    }

    public function DeleteSection($id)
    {
        $section = CourseSection::find($id);

        // delete related lectures
        $section->lectures()->delete();

        // delete the section
        $section->delete();

        // notification
        $notification = array(
            'message' => 'Course Section Deleted Successfully!',
            'alert-type' => 'success'
        );
        return redirect()->back()->with($notification);
    }
}