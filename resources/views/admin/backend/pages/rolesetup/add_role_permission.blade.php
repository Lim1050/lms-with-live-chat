@extends('admin.admin_dashboard')
@section('admin')
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<style>
    .form-check-label{
        text-transform: capitalize;
    }
</style>

<div class="page-content">
				<!--breadcrumb-->
				<div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
					{{-- <div class="breadcrumb-title pe-3">All Category</div> --}}
					<div class="ps-3">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb mb-0 p-0">
								<li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}"><i class="bx bx-home-alt"></i></a>
								</li>
								<li class="breadcrumb-item active" aria-current="page">Add Role Permission</li>
							</ol>
						</nav>
					</div>
                    <div class="ms-auto">
                        <div class="btn-group">
                            <a href="{{ route('all.role.permission') }}" class="btn btn-primary px-5">Back</a>
                        </div>
                    </div>
				</div>
				<!--end breadcrumb-->
                <div class="card">
                    <div class="card-body p-4">
                        <form id="myForm" action="{{ route('store.role.permission') }}" method="POST" class="row g-3" enctype="multipart/form-data">
                            @csrf

                            <div class="form-group col-md-6">
                                <label for="input1" class="form-label">Roles Name</label>
                                <select name="role_id" class="form-select mb-3" aria-label="Default select example">
									<option selected="" disabled>Select Roles</option>
									@foreach ($roles as $role)
                                    <option value="{{ $role->id }}">{{ $role->name }}</option>
                                    @endforeach
								</select>


                                <div class="form-check">
									<input class="form-check-input" type="checkbox" value="" id="flexCheckMain">
									<label class="form-check-label" for="flexCheckMain">Permission All</label>
								</div>
                                <hr>

                                @foreach ($permission_groups as $group)
                                <div class="row">
                                    <div class="col-3">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                            <label class="form-check-label" for="flexCheckDefault">{{ $group->group_name }}</label>
                                        </div>
                                    </div>
                                    <div class="col-9">
                                        @php
                                            $permissions = App\Models\User::getpermissionByGroupName($group->group_name);
                                        @endphp
                                        @foreach ($permissions as $permission)
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" name="permission[]" value="{{ $permission->id }}" id="CheckDefault{{ $permission->id }}">
                                            <label class="form-check-label" for="CheckDefault{{ $permission->id }}">{{ $permission->name }}</label>
                                        </div>
                                        @endforeach
                                        <br>
                                    </div>
                                </div>
                                @endforeach
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

{{-- Checkbox Script --}}
<script type="text/javascript">
    $('#flexCheckMain').click(function(){
        if ($(this).is(':checked')) {
            $('input[type=checkbox]').prop('checked',true)
        }else{
            $('input[type=checkbox]').prop('checked',false)

        }
    });
</script>


@endsection
