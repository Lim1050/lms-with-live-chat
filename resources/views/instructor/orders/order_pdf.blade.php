<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Invoice</title>

<style type="text/css">
    * {
        font-family: Verdana, Arial, sans-serif;
    }
    table{
        font-size: x-small;
    }
    tfoot tr td{
        font-weight: bold;
        font-size: x-small;
    }
    .gray {
        background-color: lightgray
    }
    .font{
        font-size: 15px;
    }
    .authority {
        /*text-align: center;*/
        float: right
    }
    .authority h5 {
        margin-top: -10px;
        color: green;
        /*text-align: center;*/
        margin-left: 35px;
    }
    .thanks p {
        color: green;;
        font-size: 16px;
        font-weight: normal;
        font-family: serif;
        margin-top: 20px;
    }
</style>

</head>
<body>

    <table width="100%" style="background: #F7F7F7; padding:0 5 0 5px;" class="font">
        <tr>
            <td>
                <!-- {{-- <img src="" alt="" width="150"/> --}} -->
                <h2 style="color: green; font-size: 26px;"><strong>LMS</strong></h2>
            </td>
        </tr>
        <tr>
            <td></td>
            <td align="right">
                    Email:support@lms.com <br>
                    Mob: 1245454545 <br>
                    Jl Baru Indonesia 12123 <br>
            </td>
        </tr>
        <tr>
            <td>Name </td>
            <td>: {{ $payment->name }}</td>
        </tr>
            <td>Email </td>
            <td>: {{ $payment->email }}</td>
        </tr>
        <tr>
            <td>Phone </td>
            <td>: {{ $payment->phone }}</td>
        </tr>
        <tr>
            <td>Address </td>
            <td>: {{ $payment->address }}</td>
        </tr>
        <tr>
            <td>Invoice </td>
            <td>: {{ $payment->invoice_no }}</td>
        </tr>
        <tr>
            <td>Order Date </td>
            <td>: {{ $payment->order_date }}</td>
        </tr>
        <tr>
            <td>Delivery Date </td>
            <td>: {{ $payment->order_date }}</td>
        </tr>
        <tr>
            <td>Payment Type </td>
            <td>: {{ $payment->payment_type }}</td>
        </tr>
    </table>
    <br/>
    <h3>Products</h3>


    <table width="100%">
        <thead style="background-color: green; color:#FFFFFF;">
        <tr class="font">
            <th>Image</th>
            <th>Course Name</th>
            <th>Unit Price </th>
            <th>Total </th>
        </tr>
        </thead>
        <tbody>

        @foreach ($orderItem as $item)
        <tr class="font">
            <td align="center">
                <img src="{{ public_path($item->course->course_image) }}" height="60px;" width="60px;" alt="">
            </td>
            <td align="center">{{ $item->course->course_name }}</td>
            <td align="center">Rp{{ $item->price }}</td>
            <td align="center">Rp{{ $item->price }}</td>
        </tr>
        @endforeach


        </tbody>
    </table>
    <br>
    <table width="100%" style=" padding:0 10px 0 10px;">
        <tr>
            <td align="right" >
                <h2><span style="color: green;">Subtotal:</span> Rp{{ $payment->total_amount }}</h2>
                <h2><span style="color: green;">Total:</span> Rp{{ $payment->total_amount }}</h2>
                {{-- <h2><span style="color: green;">Full Payment PAID</h2> --}}
            </td>
        </tr>
    </table>
    <div class="thanks mt-3">
        <p>Thanks For Buying Products..!!</p>
    </div>
    <div class="authority float-right mt-5">
        <p>-----------------------------------</p>
        <h5>Authority Signature:</h5>
    </div>
</body>
</html>
