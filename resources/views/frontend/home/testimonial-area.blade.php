@php
    $reviews = App\Models\Review::where('status', 1)->latest()->get();
@endphp
<section class="testimonial-area section-padding">
    <div class="container">
        <div class="section-heading text-center">
            <h5 class="ribbon ribbon-lg mb-2">Testimonials</h5>
            <h2 class="section__title">Student's Feedback</h2>
            <span class="section-divider"></span>
        </div><!-- end section-heading -->
    </div><!-- end container -->
    <div class="container-fluid">
        <div class="testimonial-carousel owl-action-styled">
            @foreach ($reviews as $item)
            <div class="card card-item">
                <div class="card-body">
                    <div class="media media-card align-items-center pb-3">
                        <div class="media-img avatar-md">
                            <img src="{{ (!empty($item->user->photo)) ? url('upload/user_images/' . $item->user->photo) : url('upload/no_image.jpg') }}" alt="Testimonial avatar" class="rounded-full">
                        </div>
                        <div class="media-body">
                            <h5>{{ $item->user->name }}</h5>
                            <div class="d-flex align-items-center pt-1">
                                <span class="lh-18 pr-2">Student</span>
                                <div class="review-stars">
                                    @if ($item->rating == NULL)
                                        <span class="la la-star-o"></span>
                                        <span class="la la-star-o"></span>
                                        <span class="la la-star-o"></span>
                                        <span class="la la-star-o"></span>
                                        <span class="la la-star-o"></span>
                                    @elseif ($item->rating == 1)
                                        <span class="la la-star"></span>
                                        <span class="la la-star-o"></span>
                                        <span class="la la-star-o"></span>
                                        <span class="la la-star-o"></span>
                                        <span class="la la-star-o"></span>
                                    @elseif ($item->rating == 2)
                                        <span class="la la-star"></span>
                                        <span class="la la-star"></span>
                                        <span class="la la-star-o"></span>
                                        <span class="la la-star-o"></span>
                                        <span class="la la-star-o"></span>
                                    @elseif ($item->rating == 3)
                                        <span class="la la-star"></span>
                                        <span class="la la-star"></span>
                                        <span class="la la-star"></span>
                                        <span class="la la-star-o"></span>
                                        <span class="la la-star-o"></span>
                                    @elseif ($item->rating == 4)
                                        <span class="la la-star"></span>
                                        <span class="la la-star"></span>
                                        <span class="la la-star"></span>
                                        <span class="la la-star"></span>
                                        <span class="la la-star-o"></span>
                                    @elseif ($item->rating == 5)
                                        <span class="la la-star"></span>
                                        <span class="la la-star"></span>
                                        <span class="la la-star"></span>
                                        <span class="la la-star"></span>
                                        <span class="la la-star"></span>
                                    @endif
                                </div>
                            </div>
                        </div>
                    </div><!-- end media -->
                    <span class="d-block lh-18 pb-2">{{ Carbon\Carbon::parse($item->created_at)->diffForHumans() }}</span>
                    <p class="pb-2">{{ $item->comment }}</p>
                </div><!-- end card-body -->
            </div><!-- end card -->
            @endforeach
        </div><!-- end testimonial-carousel -->
    </div><!-- container-fluid -->
</section><!-- end testimonial-area -->
