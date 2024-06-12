@extends('admin.admin_dashboard')
@section('admin')
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<div class="page-content">
				<!--breadcrumb-->
				<div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
					{{-- <div class="breadcrumb-title pe-3">All Category</div> --}}
					<div class="ps-3">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb mb-0 p-0">
								<li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}"><i class="bx bx-home-alt"></i></a>
								</li>
								<li class="breadcrumb-item active" aria-current="page">Edit Blog Post</li>
							</ol>
						</nav>
					</div>
                    <div class="ms-auto">
						<div class="btn-group">
                            <a href="{{ route('blog.post') }}" class="btn btn-primary px-5">Back</a>
						</div>
					</div>
				</div>
				<!--end breadcrumb-->
                <div class="card">
                    <div class="card-body p-4">
                        <h5 class="mb-4">Edit Blog Post</h5>
                        <form id="myForm" action="{{ route('update.blog.post') }}" method="POST" class="row g-3" enctype="multipart/form-data">
                            @csrf

                            <input type="hidden" name="id" value="{{ $post->id }}">

                            <div class="form-group col-md-6">
                                <label for="input1" class="form-label">Blog Category</label>
                                <select name="blogcat_id" class="form-select mb-3" aria-label="Default select example">
									<option selected="">Open this select menu</option>
                                    @foreach ($blogcat as $cat)
									<option value="{{ $cat->id }}" {{ $cat->id == $post->blogcat_id ? 'selected' : '' }}>{{ $cat->category_name }}</option>
                                    @endforeach
								</select>
                            </div>

                            <div class="form-group col-md-6">
                                <label for="input1" class="form-label">Post Title</label>
                                <input type="text" name="post_title" class="form-control" id="input1" value="{{ $post->post_title }}">
                            </div>

                            <div class="form-group col-md-12">
                                <label for="input1" class="form-label">Post Description</label>
                                <textarea name="long_description" class="form-control" id="myeditorinstance">{!! $post->long_description !!}</textarea>
                            </div>

                            <div class="form-group col-md-6">
                                <label for="input1" class="form-label">Post Tags</label>
                                <input name="post_tags" type="text" class="form-control" data-role="tagsinput" value="{{ $post->post_tags }}">
                            </div>

                            <div class="col-md-6">
                            </div>

                            <div class="form-group col-md-6">
                                <label for="input2" class="form-label">Post Image</label>

                                <input type="file" name="post_image" class="form-control" id="image" >
                            </div>

                            <div class="col-md-6">
                                <img id="showImage" src="{{ asset($post->post_image) }}" alt="Admin" class="rounded-circle p-1 bg-primary" width="110">
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

{{-- Validate Script
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

</script> --}}

{{-- JavaScript for preview upload image --}}
<script type="text/javascript">
    $(document).ready(function(){
        $('#image').change(function(e){
            var reader = new FileReader();
            reader.onload = function(e){
                $('#showImage').attr('src', e.target.result);
            }
            reader.readAsDataURL(e.target.files['0']);
        });
    });
</script>

@endsection