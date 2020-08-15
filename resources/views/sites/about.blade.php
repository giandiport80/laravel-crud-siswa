@extends('templates.frontend')

@section('content')
<!-- start banner Area -->
<section class="banner-area relative about-banner" id="home">
  <div class="overlay overlay-bg"></div>
  <div class="container">
    <div class="row d-flex align-items-center justify-content-center">
      <div class="about-content col-lg-12">
        <h1 class="text-white">
          About Us
        </h1>
        <p class="text-white link-nav"><a href="index.html">Home </a> <span class="lnr lnr-arrow-right"></span> <a
            href="about.html"> About </a></p>
      </div>
    </div>
  </div>
</section>
<!-- End banner Area -->

<!-- Start popular-course Area -->
<section class="popular-course-area section-gap">
  <div class="container">
    <div class="row d-flex justify-content-center">
      <div class="menu-content pb-70 col-lg-8">
        <div class="title text-center">
          <h1 class="mb-10">Popular Courses we offer</h1>
          <p>There is a moment in the life of any aspiring.</p>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="active-popular-carusel">
        <div class="single-popular-carusel">
          <div class="thumb-wrap relative">
            <div class="thumb relative">
              <div class="overlay overlay-bg"></div>
              <img class="img-fluid" src="{{ asset('frontend') }}/img/p1.jpg" alt="">
            </div>
            <div class="meta d-flex justify-content-between">
              <p><span class="lnr lnr-users"></span> 355 <span class="lnr lnr-bubble"></span>35</p>
              <h4>$150</h4>
            </div>
          </div>
          <div class="details">
            <a href="#">
              <h4>
                Learn Designing
              </h4>
            </a>
            <p>
              When television was young, there was a hugely popular show based on the still popular fictional characte
            </p>
          </div>
        </div>
        <div class="single-popular-carusel">
          <div class="thumb-wrap relative">
            <div class="thumb relative">
              <div class="overlay overlay-bg"></div>
              <img class="img-fluid" src="{{ asset('frontend') }}/img/p2.jpg" alt="">
            </div>
            <div class="meta d-flex justify-content-between">
              <p><span class="lnr lnr-users"></span> 355 <span class="lnr lnr-bubble"></span>35</p>
              <h4>$150</h4>
            </div>
          </div>
          <div class="details">
            <a href="#">
              <h4>
                Learn React js beginners
              </h4>
            </a>
            <p>
              When television was young, there was a hugely popular show based on the still popular fictional characte
            </p>
          </div>
        </div>
        <div class="single-popular-carusel">
          <div class="thumb-wrap relative">
            <div class="thumb relative">
              <div class="overlay overlay-bg"></div>
              <img class="img-fluid" src="{{ asset('frontend') }}/img/p3.jpg" alt="">
            </div>
            <div class="meta d-flex justify-content-between">
              <p><span class="lnr lnr-users"></span> 355 <span class="lnr lnr-bubble"></span>35</p>
              <h4>$150</h4>
            </div>
          </div>
          <div class="details">
            <a href="#">
              <h4>
                Learn Photography
              </h4>
            </a>
            <p>
              When television was young, there was a hugely popular show based on the still popular fictional characte
            </p>
          </div>
        </div>
        <div class="single-popular-carusel">
          <div class="thumb-wrap relative">
            <div class="thumb relative">
              <div class="overlay overlay-bg"></div>
              <img class="img-fluid" src="{{ asset('frontend') }}/img/p4.jpg" alt="">
            </div>
            <div class="meta d-flex justify-content-between">
              <p><span class="lnr lnr-users"></span> 355 <span class="lnr lnr-bubble"></span>35</p>
              <h4>$150</h4>
            </div>
          </div>
          <div class="details">
            <a href="#">
              <h4>
                Learn Surveying
              </h4>
            </a>
            <p>
              When television was young, there was a hugely popular show based on the still popular fictional characte
            </p>
          </div>
        </div>
        <div class="single-popular-carusel">
          <div class="thumb-wrap relative">
            <div class="thumb relative">
              <div class="overlay overlay-bg"></div>
              <img class="img-fluid" src="{{ asset('frontend') }}/img/p1.jpg" alt="">
            </div>
            <div class="meta d-flex justify-content-between">
              <p><span class="lnr lnr-users"></span> 355 <span class="lnr lnr-bubble"></span>35</p>
              <h4>$150</h4>
            </div>
          </div>
          <div class="details">
            <a href="#">
              <h4>
                Learn Designing
              </h4>
            </a>
            <p>
              When television was young, there was a hugely popular show based on the still popular fictional characte
            </p>
          </div>
        </div>
        <div class="single-popular-carusel">
          <div class="thumb-wrap relative">
            <div class="thumb relative">
              <div class="overlay overlay-bg"></div>
              <img class="img-fluid" src="{{ asset('frontend') }}/img/p2.jpg" alt="">
            </div>
            <div class="meta d-flex justify-content-between">
              <p><span class="lnr lnr-users"></span> 355 <span class="lnr lnr-bubble"></span>35</p>
              <h4>$150</h4>
            </div>
          </div>
          <div class="details">
            <a href="#">
              <h4>
                Learn React js beginners
              </h4>
            </a>
            <p>
              When television was young, there was a hugely popular show based on the still popular fictional characte
            </p>
          </div>
        </div>
        <div class="single-popular-carusel">
          <div class="thumb-wrap relative">
            <div class="thumb relative">
              <div class="overlay overlay-bg"></div>
              <img class="img-fluid" src="{{ asset('frontend') }}/img/p3.jpg" alt="">
            </div>
            <div class="meta d-flex justify-content-between">
              <p><span class="lnr lnr-users"></span> 355 <span class="lnr lnr-bubble"></span>35</p>
              <h4>$150</h4>
            </div>
          </div>
          <div class="details">
            <a href="#">
              <h4>
                Learn Photography
              </h4>
            </a>
            <p>
              When television was young, there was a hugely popular show based on the still popular fictional characte
            </p>
          </div>
        </div>
        <div class="single-popular-carusel">
          <div class="thumb-wrap relative">
            <div class="thumb relative">
              <div class="overlay overlay-bg"></div>
              <img class="img-fluid" src="{{ asset('frontend') }}/img/p4.jpg" alt="">
            </div>
            <div class="meta d-flex justify-content-between">
              <p><span class="lnr lnr-users"></span> 355 <span class="lnr lnr-bubble"></span>35</p>
              <h4>$150</h4>
            </div>
          </div>
          <div class="details">
            <a href="#">
              <h4>
                Learn Surveying
              </h4>
            </a>
            <p>
              When television was young, there was a hugely popular show based on the still popular fictional characte
            </p>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- End popular-course Area -->
@endsection