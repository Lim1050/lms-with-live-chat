<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;
use App\Models\Category;
use App\Models\SubCategory;
use App\Models\Course;
use App\Models\Course_goal;
use Carbon\Carbon;

class CourseControllerTest extends TestCase
{
    /**
     * A basic feature test example.
     */
    public function testStoreCourse()
    {
        $response = $this->post(route('store.course'), [
            'category_id' => '9',
            'subcategory_id' => '4',
            'instructor_id' => '2',
            'course_title' => 'test',
            'course_name' => 'test',
            'course_name_slug' => 'test',
            'description' => 'test',
            'video' => 'upload/course/video/test',

            'label' => 'test',
            'duration' => '5 test',
            'resources' => 'test',
            'certificate' => 'yes',
            'selling_price' => 100,
            'discount_price' => 50,
            'prerequisites' => 'asd',
            'bestseller' => 'yes',
            'feature' => 'yes',
            'highestrated' => 'yes',
            'status' => 1,
            'course_image' => 'upload/course/thumbnail/test',
            'created_at' => Carbon::now(),
        ]);

        $response->assertStatus(302); // Check if the response is a redirect
        $response->assertRedirect(route('all.course')); // Check if the redirect is to the correct route
    }
}
