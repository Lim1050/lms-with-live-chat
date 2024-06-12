@extends('admin.admin_dashboard')
@section('admin')

<div class="page-content">
				<!--breadcrumb-->
				<div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
					{{-- <div class="breadcrumb-title pe-3">All Category</div> --}}
					<div class="ps-3">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb mb-0 p-0">
								<li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}"><i class="bx bx-home-alt"></i></a>
								</li>
								<li class="breadcrumb-item active" aria-current="page">Report By Year</li>
							</ol>
						</nav>
					</div>
					{{-- <div class="ms-auto">
						<div class="btn-group">
                            <a href="{{ route('add.category') }}" class="btn btn-primary px-5">Add Category</a>
						</div>
					</div> --}}
				</div>
				<!--end breadcrumb-->

                <h3>Search By Year : {{ $year }}</h3>

				<div class="card">
					<div class="card-body">
						<div class="table-responsive">
							<table id="example" class="table table-striped table-bordered" style="width:100%">
								<thead>
									<tr>
										<th>Sl</th>
										<th>Date</th>
										<th>Invoice</th>
										<th>Name</th>
										<th>Email</th>
										<th>Phone</th>
										<th>Address</th>
										<th>Amount</th>
										<th>Payment Type</th>
										<th>Status</th>
									</tr>
								</thead>
								<tbody>
                                    @foreach ($payment as $key=> $item)

                                    <tr>
										<td>{{ $key+1 }}</td>
										<td>{{ $item->order_date }}</td>
										<td>{{ $item->invoice_no }}</td>
										<td>{{ $item->name }}</td>
										<td>{{ $item->email }}</td>
										<td>{{ $item->phone }}</td>
										<td>{{ $item->address }}</td>
										<td>{{ $item->total_amount }}</td>
										<td>{{ $item->payment_type }}</td>
										<td>@if ($item->status == 'confirmed')
                                            <span class="badge rounded-pill bg-success">{{ $item->status }}</span>
                                            @else
                                            <span class="badge rounded-pill bg-warning">{{ $item->status }}</span>
                                            @endif</span></td>
									</tr>

                                    @endforeach
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>

@endsection
