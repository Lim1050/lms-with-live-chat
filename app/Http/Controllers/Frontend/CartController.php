<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Mail\Orderconfirm;
use App\Notifications\OrderComplete;
use Illuminate\Http\Request;
use App\Models\CourseLecture;
use App\Models\CourseSection;
use App\Models\Category;
use App\Models\Coupon;
use App\Models\SubCategory;
use App\Models\Course;
use App\Models\Course_goal;
use Carbon\Carbon;
use Gloudemans\Shoppingcart\Facades\Cart;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;
use Intervention\Image\ImageManager;
use Intervention\Image\Drivers\Gd\Driver;
use App\Models\Order;
use App\Models\Payment;
use App\Models\User;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Notification;
use Stripe;

class CartController extends Controller
{
    public function AddToCart(Request $request, $id)
    {
        $course = Course::find($id);

        if (Session::has('coupon')) {
            Session::forget('coupon');
        }

        // check if the course is already in the cart
        $cartItem = Cart::search(function ($cartItem, $rowId) use ($id) {
            return $cartItem->id === $id;
        });

        if ($cartItem->isNotEmpty()){
            return response()->json(['error' => 'Course is already in your cart']);
        }

        if ($course->discount_price == NULL ) {
            Cart::add([
                'id' => $id,
                'name' => $request->course_name,
                'qty' => 1,
                'price' => $course->selling_price,
                'weight' => 1,
                'options' => [
                    'image' => $course->course_image,
                    'slug' => $request->course_name_slug,
                    'instructor' => $request->instructor,
                    ]
                ]);
        } else {
            Cart::add([
                'id' => $id,
                'name' => $request->course_name,
                'qty' => 1,
                'price' => $course->discount_price,
                'weight' => 1,
                'options' => [
                    'image' => $course->course_image,
                    'slug' => $request->course_name_slug,
                    'instructor' => $request->instructor,
                    ]
                ]);
        }

        return response()->json(['success' => 'Successfully Added on Your Cart']);
    }

    public function CartData()
    {
        $carts = Cart::content();
        $cartTotal = Cart::total();
        $cartQty = Cart::count();

        return response()->json(
            array(
                'carts' => $carts,
                'cartTotal' => $cartTotal,
                'cartQty' => $cartQty
            )
        );
    }

    public function AddMiniCart(){

        $carts = Cart::content();
        $cartTotal = Cart::total();
        $cartQty = Cart::count();

        return response()->json(array(
            'carts' => $carts,
            'cartTotal' => $cartTotal,
            'cartQty' => $cartQty,
        ));
    }

    public function RemoveMiniCart($rowId)
    {
        Cart::remove($rowId);
        return response()->json(['success' => 'Course Removed From Cart Successfully!']);
    }

    public function MyCart()
    {
        return view('frontend.mycart.view_mycart');
    }

    public function GetCartCourse(){

        $carts = Cart::content();
        $cartTotal = Cart::total();
        $cartQty = Cart::count();

        return response()->json(array(
            'carts' => $carts,
            'cartTotal' => $cartTotal,
            'cartQty' => $cartQty,
        ));
    }

    public function CartRemove($rowId)
    {
        Cart::remove($rowId);

        if (Session::has('coupon')) {
            $coupon_name = Session::get('coupon')['coupon_name'];
            $coupon = Coupon::where('coupon_name', $coupon_name)->first();

            Session::put('coupon', [
                'coupon_name' => $coupon->coupon_name,
                'coupon_discount' => $coupon->coupon_discount,
                'discount_amount' => round(Cart::total() * $coupon->coupon_discount / 100),
                'total_amount' => round(Cart::total() - Cart::total() * $coupon->coupon_discount / 100)
            ]);
        }

        return response()->json(['success' => 'Course Removed From Cart Successfully!']);
    }

    public function CouponApply(request $request)
    {
        $coupon = Coupon::where('coupon_name', $request->coupon_name)->where('coupon_validity', '>=', Carbon::now()->format('Y-m-d'))->first();

        if ($coupon) {
            Session::put('coupon', [
                'coupon_name' => $coupon->coupon_name,
                'coupon_discount' => $coupon->coupon_discount,
                'discount_amount' => round(Cart::total() * $coupon->coupon_discount / 100),
                'total_amount' => round(Cart::total() - Cart::total() * $coupon->coupon_discount / 100)
            ]);

            return response()->json(
                array(
                    'validity' => true,
                    'success' => 'Coupon Applied Successfully!'
                )
            );
        } else {
            return response()->json(['error' => 'Invalid Coupon!']);
        }
    }

    public function InsCouponApply(request $request)
    {
        $coupon = Coupon::where('coupon_name', $request->coupon_name)
                        ->where('coupon_validity', '>=', Carbon::now()
                        ->format('Y-m-d'))
                        ->first();

        if ($coupon) {
            if ($coupon->course_id == $request->course_id && $coupon->instructor_id == $request->instructor_id) {
                Session::put('coupon', [
                    'coupon_name' => $coupon->coupon_name,
                    'coupon_discount' => $coupon->coupon_discount,
                    'discount_amount' => round(Cart::total() * $coupon->coupon_discount / 100),
                    'total_amount' => round(Cart::total() - Cart::total() * $coupon->coupon_discount / 100)
                ]);

                return response()->json(
                    array(
                        'validity' => true,
                        'success' => 'Coupon Applied Successfully!'
                    )
                );
            } else {
                return response()->json(['error' => 'The Coupon not for This Course and Instructor!']);
            }
        } else {
            return response()->json(['error' => 'Invalid Coupon!']);
        }
    }

    public function CouponCalculation()
    {
        if (Session::has('coupon')) {
            return response()->json(
                array(
                    'subtotal' => Cart::total(),
                    'coupon_name' => session()->get('coupon')['coupon_name'],
                    'coupon_discount' => session()->get('coupon')['coupon_discount'],
                    'discount_amount' => session()->get('coupon')['discount_amount'],
                    'total_amount' => session()->get('coupon')['total_amount']
                )
            );
        } else {
            return response()->json(
                array(
                    'total' => Cart::total()
                )
            );
        }
    }

    public function CouponRemove()
    {
        Session::forget('coupon');
        return response()->json(['success' => 'Coupon Removed Successfully!']);
    }

    public function CheckoutCreate()
    {
        if (Auth::check()) {
            if (Cart::total() > 0) {
                $carts = Cart::content();
                $cartTotal = Cart::total();
                $cartQty = Cart::count();

                return view('frontend.checkout.checkout_view', compact('carts', 'cartTotal', 'cartQty'));
            } else {
                // Notification Function
                $notification = array(
                    'message' => 'Add At Least One Course!',
                    'alert-type' => 'error'
                );
                return redirect()->to('/')->with($notification);
            }
        } else {
            // Notification Function
                $notification = array(
                    'message' => 'You Need To Login First!',
                    'alert-type' => 'error'
                );
                return redirect()->route('login')->with($notification);
        }
    }

    public function Payment(Request $request)
    {
        $user = User::where('role', 'instructor')->get();

        if (Session::has('coupon')) {
            $total_amount = Session::get('coupon')['total_amount'];

        } else {
            $total_amount = round(Cart::total());
        } //end if

        $data = array();
            $data['name'] = $request->name;
            $data['email'] = $request->email;
            $data['phone'] = $request->phone;
            $data['address'] = $request->address;
            $data['course_title'] = $request->course_title;
            $cartTotal = Cart::total();
            $carts = Cart::content();


        if ($request->cash_delivery == 'stripe') {
            return view('frontend.payment.stripe', compact('data', 'cartTotal', 'carts'));

        } elseif($request->cash_delivery == 'midtrans') {
            $order_id = Payment::insertGetId([
            // create a new Payment Record
            'name' => $request->name,
            'email' => $request->email,
            'phone' => $request->phone,
            'address' => $request->address,
            'total_amount' => $total_amount,
            'payment_type' => 'Midtrans Payment',
            'invoice_no' => 'MID' . mt_rand(00000000, 99999999),
            'order_date' => Carbon::now()->format('d F Y'),
            'order_month' => Carbon::now()->format('F'),
            'order_year' => Carbon::now()->format('Y'),
            'status' => 'pending',
            'created_at' => Carbon::now()
            ]);

            $carts = Cart::content();
            foreach ($carts as $cart) {
                // $existingOrder = Order::where('user_id', Auth::user()->id)->where('course_id', $cart->id)->first();
                // if ($existingOrder) {
                //     // Notification Function
                //     $notification = array(
                //         'message' => 'You Have Already Enrolled In This Course!',
                //         'alert-type' => 'error'
                //     );
                //     return redirect()->back()->with($notification);
                // } //end if
                Order::insert([
                    'payment_id' => $order_id,
                    'user_id' => Auth::user()->id,
                    'course_id' => $cart->id,
                    'instructor_id' => $cart->options->instructor,
                    'course_title' => $cart->name,
                    'price' => $cart->price
                ]);
            } //end foreach

            // Set your Merchant Server Key
            \Midtrans\Config::$serverKey = config('midtrans.server_key');
            // Set to Development/Sandbox Environment (default). Set to true for Production Environment (accept real transaction).
            \Midtrans\Config::$isProduction = false;
            // Set sanitization on (default)
            \Midtrans\Config::$isSanitized = true;
            // Set 3DS transaction for credit card to true
            \Midtrans\Config::$is3ds = true;

            $params = array(
                'transaction_details' => array(
                    'order_id' => $order_id,
                    'gross_amount' => $total_amount,
                ),
                'customer_details' => array(
                    'first_name' => Auth::user()->name,
                    'last_name' => '',
                    'email' => Auth::user()->email,
                    'phone' => Auth::user()->phone,
                ),
            );

            if(Session::has('coupon')){
            Session::forget('coupon');
            }
            Cart::destroy();


            $snapToken = \Midtrans\Snap::getSnapToken($params);
            // dd($snapToken);
            return view('frontend.payment.midtrans', compact('snapToken', 'data', 'cartTotal', 'carts', 'order_id'));

        } elseif($request->cash_delivery == 'handcash') {

        // create a new Payment Record
        $data = new Payment();
        $data->name = $request->name;
        $data->email = $request->email;
        $data->phone = $request->phone;
        $data->address = $request->address;

        $data->cash_delivery = $request->cash_delivery;
        $data->total_amount = $total_amount;
        $data->payment_type = 'Direct Payment';
        $data->invoice_no = 'EOS' . mt_rand(00000000, 99999999);

        $data->order_date = Carbon::now()->format('d F Y');
        $data->order_month = Carbon::now()->format('F');
        $data->order_year = Carbon::now()->format('Y');
        $data->status = 'pending';
        $data->created_at = Carbon::now();
        $data->save();

        foreach ($request->course_title as $key => $course_title) {
            $existingOrder = Order::where('user_id', Auth::user()->id)->where('course_id', $request->course_id[$key])->first();

            if ($existingOrder) {
                // Notification Function
                $notification = array(
                    'message' => 'You Have Already Enrolled In This Course!',
                    'alert-type' => 'error'
                );
                return redirect()->back()->with($notification);
            } //end if

            $order = new Order();
            $order->payment_id = $data->id;
            $order->user_id = Auth::user()->id;
            $order->course_id = $request->course_id[$key];
            $order->instructor_id = $request->instructor_id[$key];
            $order->course_title = $course_title;
            $order->price = $request->price[$key];
            $order->save();
        } // end foreach

        $request->session()->forget('cart');

        $paymentId = $data->id;

        // Start Send email to student
        $sendmail = Payment::find($paymentId);

        $data = [
            'invoice_no' => $sendmail->invoice_no,
            'amount' => $total_amount,
            'name' => $sendmail->name,
            'email' => $sendmail->email,
        ];

        Mail::to($request->email)->send(new Orderconfirm($data));
        // End Send email to student

        // Send Notification
            Notification::send($user, new OrderComplete($request->name));

        // Notification Function
            $notification = array(
                'message' => 'Cash Payment Submit Successfully!',
                'alert-type' => 'success'
            );
            return redirect()->route('index')->with($notification);

        }
        // end elseif payment
    } // end method

    public function MidtransCallback(Request $request)
    {
        $serverKey = config('midtrans.server_key');
        $hashed = hash("sha512", $request->order_id . $request->status_code . $request->gross_amount . $serverKey);
        if($hashed == $request->signature_key){
            if($request->transaction_status == 'capture'){
                Payment::where('id', $request->order_id)->update(['status' => 'confirmed']);
            }
        }
    }

    public function MidtransInvoice($id)
    {
        $payment = Payment::find($id);
        $orderItem = Order::where('payment_id', $payment->id)->orderBy('id', 'DESC')->get();
        return view('frontend.payment.midtrans-invoice', compact('payment','orderItem'));
    }

    public function StripeOrder(Request $request)
    {
        if (Session::has('coupon')) {
            $total_amount = Session::get('coupon')['total_amount'];

        } else {
            $total_amount = round(Cart::total());
        } //end if

        \Stripe\Stripe::setApiKey('sk_test_51P7BmmP2g1wB0BpHXpc5Ex4Me18N5VmyTp3C2oz8TdnD307lNA1IkaKThDfayf0SCRc4NWcC70cECNJ9cIjH1HAn001CIBJ7RX');

        $token = $_POST['stripeToken'];

        $charge = \Stripe\Charge::create([
            'amount' => $total_amount*100,
            'currency' => 'usd',
            'description' => 'LMS',
            'source' => $token,
            'metadata' => ['order_id' => '3434'],
        ]);

        $order_id = Payment::insertGetId([
            // create a new Payment Record
            'name' => $request->name,
            'email' => $request->email,
            'phone' => $request->phone,
            'address' => $request->address,
            'total_amount' => $total_amount,
            'payment_type' => 'Stripe Payment',
            'invoice_no' => 'EOS' . mt_rand(00000000, 99999999),
            'order_date' => Carbon::now()->format('d F Y'),
            'order_month' => Carbon::now()->format('F'),
            'order_year' => Carbon::now()->format('Y'),
            'status' => 'pending',
            'created_at' => Carbon::now()
        ]);

        $carts = Cart::content();
        foreach ($carts as $cart) {
            $existingOrder = Order::where('user_id', Auth::user()->id)->where('course_id', $cart->id)->first();
            if ($existingOrder) {
                // Notification Function
                $notification = array(
                    'message' => 'You Have Already Enrolled In This Course!',
                    'alert-type' => 'error'
                );
                return redirect()->back()->with($notification);
            } //end if
            Order::insert([
                'payment_id' => $order_id,
                'user_id' => Auth::user()->id,
                'course_id' => $cart->id,
                'instructor_id' => $cart->options->instructor,
                'course_title' => $cart->name,
                'price' => $cart->price
            ]);
        } //end foreach

        if(Session::has('coupon')){
            Session::forget('coupon');
        }
        Cart::destroy();

        // Notification Function
            $notification = array(
                'message' => 'Stipe Payment Submit Successfully!',
                'alert-type' => 'success'
            );
            return redirect()->route('index')->with($notification);
    }

    // public function MidtransOrder(Request $request)
    // {
    //     if (Session::has('coupon')) {
    //         $total_amount = Session::get('coupon')['total_amount'];

    //     } else {
    //         $total_amount = round(Cart::total());
    //     } //end if

    //     $order_id = Payment::insertGetId([
    //         // create a new Payment Record
    //         'name' => $request->name,
    //         'email' => $request->email,
    //         'phone' => $request->phone,
    //         'address' => $request->address,
    //         'total_amount' => $total_amount,
    //         'payment_type' => 'Midtrans Payment',
    //         'invoice_no' => 'MID' . mt_rand(00000000, 99999999),
    //         'order_date' => Carbon::now()->format('d F Y'),
    //         'order_month' => Carbon::now()->format('F'),
    //         'order_year' => Carbon::now()->format('Y'),
    //         'status' => 'pending',
    //         'created_at' => Carbon::now()
    //     ]);

    //     $carts = Cart::content();
    //     foreach ($carts as $cart) {
    //         $existingOrder = Order::where('user_id', Auth::user()->id)->where('course_id', $cart->id)->first();
    //         if ($existingOrder) {
    //             // Notification Function
    //             $notification = array(
    //                 'message' => 'You Have Already Enrolled In This Course!',
    //                 'alert-type' => 'error'
    //             );
    //             return redirect()->back()->with($notification);
    //         } //end if
    //         Order::insert([
    //             'payment_id' => $order_id,
    //             'user_id' => Auth::user()->id,
    //             'course_id' => $cart->id,
    //             'instructor_id' => $cart->options->instructor,
    //             'course_title' => $cart->name,
    //             'price' => $cart->price
    //         ]);
    //     } //end foreach

    //     // Set your Merchant Server Key
    //     \Midtrans\Config::$serverKey = config('midtrans.server_key');
    //     // Set to Development/Sandbox Environment (default). Set to true for Production Environment (accept real transaction).
    //     \Midtrans\Config::$isProduction = false;
    //     // Set sanitization on (default)
    //     \Midtrans\Config::$isSanitized = true;
    //     // Set 3DS transaction for credit card to true
    //     \Midtrans\Config::$is3ds = true;

    //     $params = array(
    //         'transaction_details' => array(
    //             'order_id' => $order_id,
    //             'gross_amount' => $total_amount,
    //         ),
    //         'customer_details' => array(
    //             'first_name' => Auth::user()->name,
    //             'last_name' => '',
    //             'email' => Auth::user()->email,
    //             'phone' => Auth::user()->phone,
    //         ),
    //     );


    //     $snapToken = \Midtrans\Snap::getSnapToken($params);
    //     return view('frontend.payment.midtrans', compact('snapToken', 'order_id', 'carts'));



        // if(Session::has('coupon')){
        //     Session::forget('coupon');
        // }
        // Cart::destroy();

        // // Notification Function
        //     $notification = array(
        //         'message' => 'Midtrans Payment Submit Successfully!',
        //         'alert-type' => 'success'
        //     );
        //     return redirect()->route('index')->with($notification);
    // }

    public function BuyToCart(Request $request, $id)
    {
        $course = Course::find($id);

        // check if the course is already in the cart
        $cartItem = Cart::search(function ($cartItem, $rowId) use ($id) {
            return $cartItem->id === $id;
        });

        if ($cartItem->isNotEmpty()){
            return response()->json(['error' => 'Course is already in your cart']);
        }

        if ($course->discount_price == NULL ) {
            Cart::add([
                'id' => $id,
                'name' => $request->course_name,
                'qty' => 1,
                'price' => $course->selling_price,
                'weight' => 1,
                'options' => [
                    'image' => $course->course_image,
                    'slug' => $request->course_name_slug,
                    'instructor' => $request->instructor,
                    ]
                ]);
        } else {
            Cart::add([
                'id' => $id,
                'name' => $request->course_name,
                'qty' => 1,
                'price' => $course->discount_price,
                'weight' => 1,
                'options' => [
                    'image' => $course->course_image,
                    'slug' => $request->course_name_slug,
                    'instructor' => $request->instructor,
                    ]
                ]);
        }

        return response()->json(['success' => 'Successfully Added on Your Cart']);
    }

    public function MarkAsRead(Request $request, $notificationId)
    {
        $user = Auth::user();
        $notification = $user->notifications()->where('id', $notificationId)->first();

        if ($notification) {
            $notification->markAsRead();
        }
        return response()->json(['count' => $user->unreadNotifications()->count()]);
    }
}
