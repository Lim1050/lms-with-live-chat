@extends('instructor.instructor_dashboard')
@section('instructor')
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<div class="page-content">
				<!--breadcrumb-->
				<div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
					{{-- <div class="breadcrumb-title pe-3">All Category</div> --}}
					<div class="ps-3">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb mb-0 p-0">
								<li class="breadcrumb-item"><a href="{{ route('instructor.dashboard') }}"><i class="bx bx-home-alt"></i></a>
								</li>
								<li class="breadcrumb-item active" aria-current="page">Add Coupon</li>
							</ol>
						</nav>
					</div>
                    <div class="ms-auto">
                        <div class="btn-group">
                            <a href="{{ route('instructor.all.coupon') }}" class="btn btn-primary px-5">Back</a>
                        </div>
					</div>
				</div>
				<!--end breadcrumb-->
                <div class="card">
                    <div class="card-body p-4">
                        <h5 class="mb-4">Add Coupon</h5>
                        <form id="myForm" action="{{ route('instructor.store.coupon') }}" method="POST" class="row g-3" enctype="multipart/form-data">
                            @csrf
                            <div class="form-group col-md-6">
                                <label for="input1" class="form-label">Coupon Name</label>
                                <input type="text" name="coupon_name" class="form-control" id="input1">
                            </div>

                            <div class="form-group col-md-6">
                                <label for="input1" class="form-label">Coupon Discount</label>
                                <input type="text" name="coupon_discount" class="form-control" id="input1">
                            </div>

                            <div class="form-group col-md-6">
                                <label for="input1" class="form-label">Courses</label>
                                <select name="course_id" class="form-select mb-3" aria-label="Default select example">
									<option selected="">Open this select menu</option>
                                    @foreach ($courses as $course)
									    <option value="{{ $course->id }}">{{ $course->course_name }}</option>
                                    @endforeach
								</select>
                            </div>

                            <div class="form-group col-md-6">
                                <label for="input1" class="form-label">Coupon Validity Date</label>
                                <input type="date" min="{{ Carbon\Carbon::now()->format('Y-m-d') }}" name="coupon_validity" class="form-control" id="input1">
                            </div>


                            <div class="col-md-12">
                                <div class="d-md-flex d-grid align-items-center gap-3">
                                    <button type="submit" class="btn btn-primary px-4">Save Changes</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
			</div>

{{-- Validate Script --}}
<script type="text/javascript">
    $(document).ready(function (){
        $('#myForm').validate({
            rules: {
                category_name: {
                    required : true,
                },
                image: {
                    required : true,
                },

            },
            messages :{
                category_name: {
                    required : 'Please Enter Category Name!',
                },
                image: {
                    required : 'Please Add Category Image!',
                },


            },
            errorElement : 'span',
            errorPlacement: function (error,element) {
                error.addClass('invalid-feedback');
                element.closest('.form-group').append(error);
            },
            highlight : function(element, errorClass, validClass){
                $(element).addClass('is-invalid');
            },
            unhighlight : function(element, errorClass, validClass){
                $(element).removeClass('is-invalid');
            },
        });
    });

</script>*

@endsection
