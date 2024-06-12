@extends('instructor.instructor_dashboard')
@section('instructor')

<div class="page-content">
				<!--breadcrumb-->
				<div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
					{{-- <div class="breadcrumb-title pe-3">All Category</div> --}}
					<div class="ps-3">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb mb-0 p-0">
								<li class="breadcrumb-item"><a href="{{ route('instructor.dashboard') }}"><i class="bx bx-home-alt"></i></a>
								</li>
								<li class="breadcrumb-item active" aria-current="page">All Orders</li>
							</ol>
						</nav>
					</div>
					<div class="ms-auto">
						<div class="btn-group">
						</div>
					</div>
				</div>
				<!--end breadcrumb-->

				<div class="card">
					<div class="card-body">
						<div class="table-responsive">
							<table id="example" class="table table-striped table-bordered" style="width:100%">
								<thead>
									<tr>
										<th>Sl</th>
										<th>Date</th>
										<th>Invoice</th>
										<th>Amount</th>
										<th>Payment</th>
										<th>Status</th>
										<th>Action</th>
									</tr>
								</thead>
								<tbody>
                                    @foreach ($orderItem as $key=> $item)

                                    <tr>
										<td>{{ $key+1 }}</td>
										<td>{{ $item->payment->order_date }}</td>
										<td>{{ $item->payment->invoice_no }}</td>
										<td>Rp{{ $item->payment->total_amount }}</td>
										<td>{{ $item->payment->payment_type }}</td>
										<td>
                                            @if ($item->payment->status == 'confirmed')
                                            <span class="badge rounded-pill bg-success">{{ $item->payment->status }}</span>
                                            @else
                                            <span class="badge rounded-pill bg-warning">{{ $item->payment->status }}</span>
                                            @endif
                                        </td>
										<td>
                                            <a href="{{ route('instructor.order.details', $item->payment->id) }}" class="btn btn-primary px-5" title="details"><i class="lni lni-eye"></i></a>
                                            <a href="{{ route('instructor.order.invoice', $item->payment->id) }}" class="btn btn-secondary px-5" title="download invoice"><i class="lni lni-download"></i></a>
                                        </td>
									</tr>

                                    @endforeach
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>

@endsection
