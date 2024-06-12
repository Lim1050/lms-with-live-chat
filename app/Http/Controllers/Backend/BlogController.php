<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\BlogCategory;
use App\Models\BlogPost;
use Carbon\Carbon;
use Intervention\Image\ImageManager;
use Intervention\Image\Drivers\Gd\Driver;

class BlogController extends Controller
{
    // Blog Category Method
    public function BlogCategory()
    {
        $category = BlogCategory::latest()->get();
        return view('admin.backend.blog_category.all_blog_category', compact('category'));
    }

    public function StoreBlogCategory(Request $request)
    {
        BlogCategory::insert([
            'category_name' => $request->category_name,
            'category_slug' => strtolower(str_replace(' ', '-', $request->category_name)),
            'created_at' => Carbon::now()
        ]);

        // Notification Function
        $notification = array(
            'message' => 'Blog Category Added Successfully!',
            'alert-type' => 'success'
        );
        return redirect()->back()->with($notification);
    }

    public function EditBlogCategory($id)
    {
        $categories = BlogCategory::find($id);
        return response()->json($categories);
    }

    public function UpdateBlogCategory(Request $request)
    {
        $cat_id = $request->cat_id;

        BlogCategory::find($cat_id)->update([
            'category_name' => $request->category_name,
            'category_slug' => strtolower(str_replace(' ', '-', $request->category_name)),
            'updated_at' => Carbon::now()
        ]);

        // Notification Function
        $notification = array(
            'message' => 'Blog Category Updated Successfully!',
            'alert-type' => 'success'
        );
        return redirect()->back()->with($notification);
    }

    public function DeleteBlogCategory($id)
    {
        BlogCategory::find($id)->delete();

        // Notification Function
        $notification = array(
            'message' => 'Blog Category Deleted Successfully!',
            'alert-type' => 'success'
        );
        return redirect()->back()->with($notification);
    }

    // All Blog Post Method

    public function BlogPost()
    {
        $post = BlogPost::latest()->get();
        return view('admin.backend.post.all_post', compact('post'));
    }

    public function AddBlogPost()
    {
        $blogcat = BlogCategory::latest()->get();
        return view('admin.backend.post.add_post', compact('blogcat'));
    }

    public function StoreBlogPost(Request $request)
    {
        if ($request->file('post_image')) {
            $manager = new ImageManager(new Driver());
            $name_gen = hexdec(uniqid()) . '.' . $request->file('post_image')->getClientOriginalExtension();
            $img = $manager->read($request->file('post_image'));
            $img = $img->resize(370, 247);

            $img->toJpeg(80)->save(base_path('public/upload/post/' . $name_gen));
            $save_url = 'upload/post/' . $name_gen;

            BlogPost::insert([
            'blogcat_id' => $request->blogcat_id,
            'post_title' => $request->post_title,
            'post_slug' => strtolower(str_replace(' ', '-', $request->post_title)),
            'post_image' => $save_url,
            'long_description' => $request->long_description,
            'post_tags' => $request->post_tags,
            'created_at' => Carbon::now()
            ]);
        }

        // Notification Function
        $notification = array(
            'message' => 'Blog Post Added Successfully!',
            'alert-type' => 'success'
        );
        return redirect()->route('blog.post')->with($notification);
    }

    public function EditBlogPost($id)
    {
        $blogcat = BlogCategory::latest()->get();
        $post = BlogPost::find($id);
        return view('admin.backend.post.edit_post', compact('blogcat','post'));
    }

    public function UpdateBlogPost(Request $request)
    {
        $post_id = $request->id;

        if ($request->file('post_image')){
            $manager = new ImageManager(new Driver());
            $name_gen = hexdec(uniqid()) . '.' . $request->file('post_image')->getClientOriginalExtension();
            $img = $manager->read($request->file('post_image'));
            $img = $img->resize(370, 247);

            $img->toJpeg(80)->save(base_path('public/upload/post/' . $name_gen));
            $save_url = 'upload/post/' . $name_gen;

            BlogPost::find($post_id)->update([
                'blogcat_id' => $request->blogcat_id,
                'post_title' => $request->post_title,
                'post_slug' => strtolower(str_replace(' ', '-', $request->post_title)),
                'post_image' => $save_url,
                'long_description' => $request->long_description,
                'post_tags' => $request->post_tags,
                'updated_at' => Carbon::now()
            ]);

            // Notification Function
            $notification = array(
                'message' => 'Blog Post Updated With Image Successfully!',
                'alert-type' => 'success'
            );
            return redirect()->route('blog.post')->with($notification);
        } else {
            BlogPost::find($post_id)->update([
                'blogcat_id' => $request->blogcat_id,
                'post_title' => $request->post_title,
                'post_slug' => strtolower(str_replace(' ', '-', $request->post_title)),
                'long_description' => $request->long_description,
                'post_tags' => $request->post_tags,
                'updated_at' => Carbon::now()
            ]);

            // Notification Function
            $notification = array(
                'message' => 'Blog Post Updated Without Image Successfully!',
                'alert-type' => 'success'
            );
            return redirect()->route('blog.post')->with($notification);
        }
    }

    public function DeleteBlogPost($id)
    {
        $item = BlogPost::find($id);
        $img = $item->post_image;
        unlink($img);

        BlogPost::find($id)->delete();

        // Notification Function
            $notification = array(
                'message' => 'Blog Post Deleted Successfully!',
                'alert-type' => 'success'
            );
            return redirect()->back()->with($notification);
    }

    public function BlogDetails($slug)
    {
        $blog = BlogPost::where('post_slug', $slug)->first();
        $tags = $blog->post_tags;
        $tags_all = explode(',', $tags);
        $blog_category = BlogCategory::latest()->get();
        $post = BlogPost::latest()->limit(3)->get();

        return view('frontend.blog.blog_details', compact('blog','tags_all', 'blog_category', 'post'));
    }

    public function BlogCategoryList($id)
    {
        $blog = BlogPost::where('blogcat_id', $id)->get();
        $breadcat = BlogCategory::where('id', $id)->first();
        $blog_category = BlogCategory::latest()->get();
        $post = BlogPost::latest()->limit(3)->get();
        return view('frontend.blog.blog_category_list', compact('blog', 'breadcat', 'blog_category', 'post'));
    }

    public function BlogList()
    {
        $blog = BlogPost::latest()->paginate(2);
        $blog_category = BlogCategory::latest()->get();
        $post = BlogPost::latest()->limit(3)->get();

        return view('frontend.blog.blog_list', compact('blog', 'blog_category', 'post'));
    }
}
