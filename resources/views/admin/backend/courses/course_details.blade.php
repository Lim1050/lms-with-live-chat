@extends('admin.admin_dashboard')
@section('admin')
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

			<div class="page-content">
				<!--breadcrumb-->
				<div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
					{{-- <div class="breadcrumb-title pe-3">User Profile</div> --}}
					<div class="ps-3">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb mb-0 p-0">
								<li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}"><i class="bx bx-home-alt"></i></a>
								</li>
								<li class="breadcrumb-item active" aria-current="page">Course Details</li>
							</ol>
						</nav>
					</div>
					<div class="ms-auto">
                        <div class="btn-group">
                            <a href="{{ route('admin.all.course') }}" class="btn btn-primary px-5">Back</a>
                        </div>
					</div>
				</div>
				<!--end breadcrumb-->
				<div class="container">

                    <div class="card radius-10">
                        <div class="card-body">
                            <div class="d-flex align-items-center">
                                <img src="{{ asset($course->course_image) }}" class="rounded-circle p-1 border" width="90" height="90" alt="...">
                                <div class="flex-grow-1 ms-3">
                                    <h5 class="mt-0">{{ $course->course_name }}</h5>
                                    <p class="mb-0">{{ $course->course_title }}</p>
                                </div>
                            </div>
                        </div>
                    </div>

					<div class="main-body">
						<div class="row">
							<div class="col-lg-4">
								<div class="card">
                                    <div class="card-body">
                                        <table class="table mb-0">
                                            <tbody>
                                                <tr>
                                                    <td><strong>Category : </strong></td>
                                                    <td>{{ $course->category->category_name }}</td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Sub Category : </strong></td>
                                                    <td>{{ $course->subcategory->subcategory_name }}</td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Instructor : </strong></td>
                                                    <td>{{ $course->user->name }}</td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Label : </strong></td>
                                                    <td>{{ $course->label }}</td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Duration : </strong></td>
                                                    <td>{{ $course->duration }} hour</td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Video : </strong></td>
                                                    <td><video width="300" height="200" controls> <source src="{{ asset($course->video) }}" type="video/mp4"></video></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
							</div>
							<div class="col-lg-8">
								<div class="card">
                                    <div class="card-body">
                                        <table class="table mb-0">
                                            <tbody>
                                                <tr>
                                                    <td><strong>Recources : </strong></td>
                                                    <td>{{ $course->resources }}</td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Certificate : </strong></td>
                                                    <td>{{ $course->certificate }}</td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Selling Price : </strong></td>
                                                    <td>Rp{{ $course->selling_price }}</td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Discount Price : </strong></td>
                                                    <td>Rp{{ $course->discount_price }}</td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Bestseller : </strong></td>
                                                    <td>
                                                        @if ($course->bestseller == 1)
                                                        <span class="badge bg-success">Yes</span>
                                                        @else
                                                        <span class="badge bg-danger">No</span>
                                                        @endif
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Featured : </strong></td>
                                                    <td>
                                                        @if ($course->feature == 1)
                                                        <span class="badge bg-success">Yes</span>
                                                        @else
                                                        <span class="badge bg-danger">No</span>
                                                        @endif
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Highestrated : </strong></td>
                                                    <td>
                                                        @if ($course->highestrated == 1)
                                                        <span class="badge bg-success">Yes</span>
                                                        @else
                                                        <span class="badge bg-danger">No</span>
                                                        @endif
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Status : </strong></td>
                                                    <td>
                                                        @if ($course->status == 1)
                                                        <span class="badge bg-success">Active</span>
                                                        @else
                                                        <span class="badge bg-danger">Inactive</span>
                                                        @endif
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
							</div>
						</div>
					</div>
				</div>
			</div>


@endsection
