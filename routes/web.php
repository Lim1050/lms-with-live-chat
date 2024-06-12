<?php

use App\Http\Controllers\Backend\ActiveUserController;
use App\Http\Controllers\Backend\CourseController;
use App\Http\Controllers\Backend\QuestionController;
use App\Http\Controllers\Backend\ReviewController;
use App\Http\Controllers\Frontend\IndexController;
use App\Http\Controllers\Frontend\WishListController;
use App\Http\Controllers\ProfileController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\Backend\BlogController;
use App\Http\Controllers\Backend\CategoryController;
use App\Http\Controllers\Backend\CouponController;
use App\Http\Controllers\Backend\SettingController;
use App\Http\Controllers\Frontend\CartController;
use App\Http\Controllers\InstructorController;
use App\Http\Controllers\UserController;
use App\Models\User;
use App\Http\Controllers\Backend\OrderController;
use App\Http\Controllers\Backend\ReportController;
use App\Http\Controllers\Backend\RoleController;
use App\Models\Order;
use App\Http\Middleware\RedirectIfAuthenticated;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

// Route::get('/', function () {
//     return view('welcome');
// });

// Home
    Route::get('/', [UserController::class, 'Index'])->name('index');

Route::get('/dashboard', function () {
    return view('frontend.dashboard.index');
})->middleware(['auth', 'roles:user' ,'verified'])->name('dashboard');

// user group middleware
Route::middleware('auth')->group(function () {
    // user profile
    Route::get('/user/profile', [UserController::class, 'UserProfile'])->name('user.profile');

    // user profile update
    Route::post('/user/profile/update', [UserController::class, 'UserProfileUpdate'])->name('user.profile.update');

    // user change password
    Route::get('/user/change/password', [UserController::class, 'UserChangePassword'])->name('user.change.password');

    // user password update
    Route::post('/user/password/update', [UserController::class, 'UserP asswordUpdate'])->name('user.password.update');

    // user logout
    Route::get('/user/logout', [UserController::class, 'UserLogout'])->name('user.logout');

    // Wishlist Controller Route Group
    Route::controller(WishListController::class)->group(function () {
        // All Wishlist
        Route::get('/user/wishlist', 'AllWishlist')->name('user.wishlist');
        // Get Wishlist
        Route::get('/get-wishlist-course', 'GetWishlistCourse');
        // Remove Wishlist
        Route::get('/wishlist-remove/{id}', 'RemoveWishlist');
    });

    // My course Route Group
    Route::controller(OrderController::class)->group(function () {
        // My course
        Route::get('/my/course', 'MyCourse')->name('my.course');
        // My course
        Route::get('/course/view/{course_id}', 'CourseView')->name('course.view');
    });

    // User Question Route Group
    Route::controller(QuestionController::class)->group(function () {
        // Question
        Route::post('/user/question', 'UserQuestion')->name('user.question');
    });
});

// admin group middleware
Route::middleware(['auth', 'roles:admin'])->group(function () {
    // admin dashboard
    Route::get('/admin/dashboard', [AdminController::class, 'AdminDashboard'])->name('admin.dashboard');

    // admin profile
    Route::get('/admin/profile', [AdminController::class, 'AdminProfile'])->name('admin.profile');

    // admin profile store
    Route::post('/admin/profile/store', [AdminController::class, 'AdminProfileStore'])->name('admin.profile.store');

    // admin Change Password
    Route::get('/admin/change/password', [AdminController::class, 'AdminChangePassword'])->name('admin.change.password');
    // admin update Password
    Route::post('/admin/password/update', [AdminController::class, 'AdminPasswordUpdate'])->name('admin.password.update');

    // admin logout
    Route::get('/admin/logout', [AdminController::class, 'AdminLogout'])->name('admin.logout');

    // Category Controller Route Group
    Route::controller(CategoryController::class)->group(function () {
        // All Category
        Route::get('/all/category', 'AllCategory')->name('all.category')->middleware('permission:category.menu');
        // Add Category
        Route::get('/add/category', 'AddCategory')->name('add.category');
        // Store Category
        Route::post('/store/category', 'StoreCategory')->name('store.category');
        // Edit Category
        Route::get('/edit/category/{id}', 'EditCategory')->name('edit.category');
        // Update Category
        Route::post('/update/category', 'UpdateCategory')->name('update.category');
        // Delete Category
        Route::get('/delete/category/{id}', 'DeleteCategory')->name('delete.category');
    });

    // Sub Category Controller Route Group
    Route::controller(CategoryController::class)->group(function () {
        // All Sub Category
        Route::get('/all/subcategory', 'AllSubCategory')->name('all.subcategory')->middleware('permission:category.menu');
        // Add Sub Category
        Route::get('/add/subcategory', 'AddSubCategory')->name('add.subcategory');
        // Store Sub Category
        Route::post('/store/subcategory', 'StoreSubCategory')->name('store.subcategory');
        // Edit Sub Category
        Route::get('/edit/subcategory/{id}', 'EditSubCategory')->name('edit.subcategory');
        // Update Sub Category
        Route::post('/update/subcategory', 'UpdateSubCategory')->name('update.subcategory');
        // Delete Sub Category
        Route::get('/delete/subcategory/{id}', 'DeleteSubCategory')->name('delete.subcategory');
    });

    // All Instructor Route Group
    Route::controller(AdminController::class)->group(function () {
        // All Instructor
        Route::get('/all/instructor', 'AllInstructor')->name('all.instructor')->middleware('permission:instructor.menu');
        // Update Instructor Status
        Route::post('/update/user/status', 'UpdateUserStatus')->name('update.user.status');
    });

    // Admin Courses All Route Group
    Route::controller(AdminController::class)->group(function () {
        // All Course
        Route::get('/admin/all/course', 'AdminAllCourse')->name('admin.all.course')->middleware('permission:courses.menu');
        // Update Course Status
        Route::post('/update/course/status', 'UpdateCourseStatus')->name('update.course.status');
        // Admin Course Details
        Route::get('/admin/course/details/{id}', 'AdminCourseDetails')->name('admin.course.details');
    });

    // Admin Coupon All Route Group
    Route::controller(CouponController::class)->group(function () {
        // All Coupon
        Route::get('/admin/all/coupon', 'AdminAllCoupon')->name('admin.all.coupon');
        // Add Coupon
        Route::get('/admin/add/coupon', 'AdminAddCoupon')->name('admin.add.coupon');
        // Store Coupon
        Route::post('/admin/store/coupon', 'AdminStoreCoupon')->name('admin.store.coupon');
        // Edit Coupon
        Route::get('/admin/edit/coupon/{id}', 'AdminEditCoupon')->name('admin.edit.coupon');
        // Update Coupon
        Route::post('/admin/update/coupon', 'AdminUpdateCoupon')->name('admin.update.coupon');
        // Delete Coupon
        Route::get('/admin/delete/coupon/{id}', 'AdminDeleteCoupon')->name('admin.delete.coupon');
    });

    // Setting Controller Route Group
    Route::controller(SettingController::class)->group(function () {
        // SMTP Setting
        Route::get('/smtp/setting', 'SmtpSetting')->name('smtp.setting')->middleware('permission:setting.menu');
        // Update Smtp
        Route::post('/update/smtp', 'SmtpUpdate')->name('update.smtp');
        // Site Setting
        Route::get('/site/setting', 'SiteSetting')->name('site.setting');
        // Update Site
        Route::post('/update/site', 'SiteUpdate')->name('update.site');
    });

    // Admin Order Controller Route Group
    Route::controller(OrderController::class)->group(function () {
        // Admin Pending Order
        Route::get('/admin/pending/order', 'AdminPendingOrder')->name('admin.pending.order');
        // Admin Order Details
        Route::get('/admin/order/details/{id}', 'AdminOrderDetails')->name('admin.order.details');
        // pending confirm
        Route::get('/pending-confirm/{id}', 'PendingToConfirm')->name('pending-confirm');
        // Admin Confirm Order
        Route::get('/admin/confirm/order', 'AdminConfirmOrder')->name('admin.confirm.order');
    });

    // Admin Report Route Group
    Route::controller(ReportController::class)->group(function () {
        // Admin Report View
        Route::get('/report/view', 'ReportView')->name('report.view');
        // Admin Search Report By Date
        Route::post('/search/by/date', 'SearchByDate')->name('search.by.date');
        // Admin Search Report By Month
        Route::post('/search/by/month', 'SearchByMonth')->name('search.by.month');
        // Admin Search Report By Year
        Route::post('/search/by/year', 'SearchByYear')->name('search.by.year');
    });

    // Admin Review Route Group
    Route::controller(ReviewController::class)->group(function () {
        // Admin Pending Review View
        Route::get('/admin/pending/review', 'AdminPendingReview')->name('admin.pending.review');
        // Admin Update Review Status
        Route::post('/update/review/status', 'UpdateReviewStatus')->name('update.review.status');
        // Admin Active Review View
        Route::get('/admin/active/review', 'AdminActiveReview')->name('admin.active.review');
    });

    // Admin Manage User Route Group
    Route::controller(ActiveUserController::class)->group(function () {
        // Admin All User View
        Route::get('/all/user', 'AllUser')->name('all.user')->middleware('permission:all.user.menu');
        // Admin All Instructor View
        Route::get('/all/instructor', 'AllInstructor')->name('all.instructor')->middleware('permission:all.user.menu');
    });

    // Admin Manage Blog Category Route Group
    Route::controller(BlogController::class)->group(function () {
        // Admin All Blog Category
        Route::get('/blog/category', 'BlogCategory')->name('blog.category');
        // Admin Store Blog Category
        Route::post('/store/blog/category', 'StoreBlogCategory')->name('store.blog.category');
        // Admin Edit Blog Category
        Route::get('/edit/blog/category/{id}', 'EditBlogCategory');
        // Admin Update Blog Category
        Route::post('/update/blog/category', 'UpdateBlogCategory')->name('update.blog.category');
        // Admin Delete Blog Category
        Route::get('/delete/blog/category/{id}', 'DeleteBlogCategory')->name('delete.blog.category');
    });

    // Admin Manage Blog Post Route Group
    Route::controller(BlogController::class)->group(function () {
        // Admin Blog Post
        Route::get('/blog/post', 'BlogPost')->name('blog.post');
        // Admin Add Blog Post
        Route::get('/add/blog/post', 'AddBlogPost')->name('add.blog.post');
        // Admin Store Blog Post
        Route::post('/store/blog/post', 'StoreBlogPost')->name('store.blog.post');
        // Admin Edit Blog Post
        Route::get('/edit/blog/post/{id}', 'EditBlogPost')->name('edit.blog.post');
        // Admin Update Blog Post
        Route::post('/update/blog/post', 'UpdateBlogPost')->name('update.blog.post');
        // Admin Delete Blog Post
        Route::get('/delete/blog/post/{id}', 'DeleteBlogPost')->name('delete.blog.post');
    });

    // Admin Manage Permission Route Group
    Route::controller(RoleController::class)->group(function () {
        // Admin All Permission
        Route::get('/all/permission', 'AllPermission')->name('all.permission');
        // Admin Add Permission
        Route::get('/add/permission', 'AddPermission')->name('add.permission');
        // Admin Store Permission
        Route::post('/store/permission', 'StorePermission')->name('store.permission');
        // Admin Edit Permission
        Route::get('/edit/permission/{id}', 'EditPermission')->name('edit.permission');
        // Admin Update Permission
        Route::post('/update/permission', 'UpdatePermission')->name('update.permission');
        // Admin Delete Permission
        Route::get('/delete/permission/{id}', 'DeletePermission')->name('delete.permission');
        // Admin import Permission
        Route::get('/import/permission', 'ImportPermission')->name('import.permission');
        // Admin Export Permission
        Route::get('/export/permission', 'ExportPermission')->name('export.permission');
        // Admin Upload Permission
        Route::post('/upload/permission', 'UploadPermission')->name('upload.permission');
    });

    // Admin Manage Roles Route Group
    Route::controller(RoleController::class)->group(function () {
        // Admin All Roles
        Route::get('/all/roles', 'AllRoles')->name('all.roles');
        // Admin Add Roles
        Route::get('/add/roles', 'AddRoles')->name('add.roles');
        // Admin Store Roles
        Route::post('/store/roles', 'StoreRoles')->name('store.roles');
        // Admin Edit Roles
        Route::get('/edit/roles/{id}', 'EditRoles')->name('edit.roles');
        // Admin Update Roles
        Route::post('/update/roles', 'UpdateRoles')->name('update.roles');
        // Admin Delete Roles
        Route::get('/delete/roles/{id}', 'DeleteRoles')->name('delete.roles');
        // Admin Export roles
        Route::get('/export/roles', 'ExportRoles')->name('export.roles');
        // Admin import Roles
        Route::get('/import/roles', 'ImportRoles')->name('import.roles');
        // Admin Upload Roles
        Route::post('/upload/roles', 'UploadRoles')->name('upload.roles');

        // Admin All Role Permission
        Route::get('/all/role/permission', 'AllRolePermission')->name('all.role.permission');
        // Admin Add Role Permission
        Route::get('/add/role/permission', 'AddRolePermission')->name('add.role.permission');
        // Admin Store Role Permission
        Route::post('/store/role/permission', 'StoreRolePermission')->name('store.role.permission');
        // Admin Edit Role Permission
        Route::get('/edit/role/permission/{id}', 'EditRolePermission')->name('edit.role.permission');
        // Admin Update Role Permission
        Route::post('/update/role/permission/{id}', 'UpdateRolePermission')->name('update.role.permission');
        // Admin Delete Role Permission
        Route::get('/delete/role/permission/{id}', 'DeleteRolePermission')->name('delete.role.permission');
    });

    // Admin Admin User Route Group
    Route::controller(AdminController::class)->group(function () {
        // Admin All Admin
        Route::get('/all/admin', 'AllAdmin')->name('all.admin');
        // Admin Add Admin
        Route::get('/add/admin', 'AddAdmin')->name('add.admin');
        // Admin Store Admin
        Route::post('/store/admin', 'StoreAdmin')->name('store.admin');
        // Admin Edit Admin
        Route::get('/edit/admin/{id}', 'EditAdmin')->name('edit.admin');
        // Admin Update Admin
        Route::post('/update/admin/{id}', 'UpdateAdmin')->name('update.admin');
        // Admin Delete Admin
        Route::get('/delete/admin/{id}', 'DeleteAdmin')->name('delete.admin');
    });

}); // admin group middleware

// admin login
Route::get('/admin/login', [AdminController::class, 'AdminLogin'])->name('admin.login')->middleware(RedirectIfAuthenticated::class);

// Become Instructor
Route::get('/become/instructor', [AdminController::class, 'BecomeInstructor'])->name('become.instructor');
// Register Instructor
Route::post('/instructor/register', [AdminController::class, 'InstructorRegister'])->name('instructor.register');



// instructor group middleware
Route::middleware(['auth', 'roles:instructor'])->group(function () {
    // instructor dashboard
    Route::get('/instructor/dashboard', [InstructorController::class, 'InstructorDashboard'])->name('instructor.dashboard');

    // instructor profile
    Route::get('/instructor/profile', [InstructorController::class, 'InstructorProfile'])->name('instructor.profile');

    // instructor profile store
    Route::post('/instructor/profile/store', [InstructorController::class, 'InstructorProfileStore'])->name('instructor.profile.store');

    // instructor change password
    Route::get('/instructor/change/password', [InstructorController::class, 'InstructorChangePassword'])->name('instructor.change.password');

    // instructor password update
    Route::post('/instructor/password/update', [InstructorController::class, 'InstructorPasswordUpdate'])->name('instructor.password.update');

    // instructor logout
    Route::get('/instructor/logout', [InstructorController::class, 'InstructorLogout'])->name('instructor.logout');

    // Course Route Group
    Route::controller(CourseController::class)->group(function () {
        // All Course
        Route::get('/all/course', 'AllCourse')->name('all.course');
        // Add Course
        Route::get('/add/course', 'AddCourse')->name('add.course');
        // Get SubCategory
        Route::get('/subcategory/ajax/{category_id}', 'GetSubCategory');
        // Store Course
        Route::post('/store/course','StoreCourse')->name('store.course');
        // Edit Course
        Route::get('/edit/course/{id}','EditCourse')->name('edit.course');
        // Update Course
        Route::post('/update/course','UpdateCourse')->name('update.course');
        // Update Course Image
        Route::post('/update/course/image','UpdateCourseImage')->name('update.course.image');
        // Update Course Video
        Route::post('/update/course/video','UpdateCourseVideo')->name('update.course.video');
        // Update Course Goal
        Route::post('/update/course/goal','UpdateCourseGoal')->name('update.course.goal');
        // Delete Course
        Route::get('/delete/course/{id}','DeleteCourse')->name('delete.course');
    });

    // Course Section and Lecture Route Group
    Route::controller(CourseController::class)->group(function () {
        // Add Course Lecture
        Route::get('/add/course/lecture/{id}', 'AddCourseLecture')->name('add.course.lecture');
        // Add Course Section
        Route::post('/add/course/section', 'AddCourseSection')->name('add.course.section');
        // save-lecture
        Route::post('/save-lecture', 'SaveLecture')->name('save-lecture');
        // Edit Lecture
        Route::get('/edit/lecture/{id}', 'EditLecture')->name('edit.lecture');
        // Update Course Lecture
        Route::post('update/course/lecture', 'UpdateCourseLecture')->name('update.course.lecture');
        // Delete Lecture
        Route::get('/delete/lecture/{id}', 'DeleteLecture')->name('delete.lecture');
        // Delete Section
        Route::get('/delete/section/{id}', 'DeleteSection')->name('delete.section');
    });

    // Instructor Order Controller Route Group
    Route::controller(OrderController::class)->group(function () {
        // Instructor All Order
        Route::get('/intructor/all/order', 'InstructorAllOrder')->name('instructor.all.order');
        // Instructor Order Details
        Route::get('/instructor/order/details/{payment_id}', 'InstructorOrderDetails')->name('instructor.order.details');
        // Instructor Order Invoice
        Route::get('/instructor/order/invoice/{payment_id}', 'InstructorOrderInvoice')->name('instructor.order.invoice');
    });

    // Instructor Questions Controller Route Group
    Route::controller(QuestionController::class)->group(function () {
        // Instructor All Questions
        Route::get('/intructor/all/question', 'InstructorAllQuestion')->name('instructor.all.question');
        // Instructor Questions Details
        Route::get('/question/details/{id}', 'QuestionDetails')->name('question.details');
        // Instructor Reply
        Route::post('/instructor/reply', 'InstructorReply')->name('instructor.reply');
    });

    // Instructor Coupon All Route Group
    Route::controller(CouponController::class)->group(function () {
        // All Coupon
        Route::get('/instructor/all/coupon', 'InstructorAllCoupon')->name('instructor.all.coupon');
        // Add Coupon
        Route::get('/instructor/add/coupon', 'InstructorAddCoupon')->name('instructor.add.coupon');
        // Store Coupon
        Route::post('/instructor/store/coupon', 'InstructorStoreCoupon')->name('instructor.store.coupon');
        // Edit Coupon
        Route::get('/instructor/edit/coupon/{id}', 'InstructorEditCoupon')->name('instructor.edit.coupon');
        // Update Coupon
        Route::post('/instructor/update/coupon', 'InstructorUpdateCoupon')->name('instructor.update.coupon');
        // Delete Coupon
        Route::get('/instructor/delete/coupon/{id}', 'InstructorDeleteCoupon')->name('instructor.delete.coupon');
    });

    // Instructor Review All Route Group
    Route::controller(reviewController::class)->group(function () {
        // All Review
        Route::get('/instructor/all/review', 'InstructorAllReview')->name('instructor.all.review');
    });
});

// Route Accessable for All
// instructor login
Route::get('/instructor/login', [InstructorController::class, 'InstructorLogin'])->name('instructor.login')->middleware(RedirectIfAuthenticated::class);

// course details
Route::get('/course/details/{id}/{slug}', [IndexController::class, 'CourseDetails']);

// Category Course
Route::get('/category/{id}/{slug}', [IndexController::class, 'CategoryCourse']);

// SubCategory Course
Route::get('/subcategory/{id}/{slug}', [IndexController::class, 'SubCategoryCourse']);

// Instructor Details
Route::get('/instructor/details/{id}', [IndexController::class, 'InstructorDetails'])->name('instructor.details');

// /add-to-wishlist
Route::post('/add-to-wishlist/{course_id}', [WishListController::class, 'AddToWishList']);

// /add to cart
Route::post('/cart/data/store/{id}', [CartController::class, 'AddToCart']);

// Buy Course
Route::post('/buy/data/store/{id}', [CartController::class, 'BuyToCart']);

// Cart Data
Route::get('/cart/data/', [CartController::class, 'CartData']);

// Course Mini Cart (Get Data From minicart)
Route::get('/course/mini/cart/', [CartController::class, 'AddMiniCart']);

// Minicart Remove
Route::get('/minicart/course/remove/{rowId}', [CartController::class, 'RemoveMiniCart']);

// All Cart Route Group
    Route::controller(CartController::class)->group(function () {
        // My Cart
        Route::get('/mycart', 'MyCart')->name('mycart');
        // Get Cart Course
        Route::get('/get-cart-course', 'GetCartCourse');
        // Remove Cart Course
        Route::get('/cart/remove/{rowId}', 'CartRemove');
    });

// Apply Coupon
Route::post('/coupon-apply', [CartController::class, 'CouponApply']);
// Apply Instructor Coupon
Route::post('/inscoupon-apply', [CartController::class, 'InsCouponApply']);
// Coupon Calculation
Route::get('/coupon-calculation', [CartController::class, 'CouponCalculation']);
// Coupon Remove
Route::get('/coupon-remove', [CartController::class, 'CouponRemove']);

// Checkout Page Route
Route::get('/checkout', [CartController::class, 'CheckoutCreate'])->name('checkout');

// payment Page Route
Route::post('/payment', [CartController::class, 'Payment'])->name('payment');

// stripe payment route
Route::post('/stripe_order', [CartController::class, 'StripeOrder'])->name('stripe_order');

// midtrans payment route
Route::get('/midtrans_order', [CartController::class, 'MidtransOrder'])->name('midtrans_order');

// midtrans invoice route
Route::get('/midtrans-invoice/{id}', [CartController::class, 'MidtransInvoice'])->name('midtrans.invoice');

// Store Review route
Route::post('/store/review', [ReviewController::class, 'StoreReview'])->name('store.review');

// Blog Details route
Route::get('/blog/details/{slug}', [BlogController::class, 'BlogDetails']);

// Blog Category List route
Route::get('/blog/category/list/{id}', [BlogController::class, 'BlogCategoryList']);

// Blog route
Route::get('/blog', [BlogController::class, 'BlogList'])->name('blog');

// Blog route
Route::post('/mark-notification-as-read/{notification}', [CartController::class, 'MarkAsRead']);

require __DIR__.'/auth.php';
