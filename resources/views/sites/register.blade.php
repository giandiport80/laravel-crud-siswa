@extends('templates.frontend')

@section('content')
<!-- start banner Area -->
<section class="banner-area relative about-banner" id="home">
  <div class="overlay overlay-bg"></div>
  <div class="container">
    <div class="row d-flex align-items-center justify-content-center">
      <div class="about-content col-lg-12">
        <h1 class="text-white">
          Pendaftaran
        </h1>
        <p class="text-white link-nav"><a href="index.html">Home </a> <span class="lnr lnr-arrow-right"></span> <a
            href="about.html"> Pendaftaran</a></p>
      </div>
    </div>
  </div>
</section>
<!-- End banner Area -->

<section class="search-course-area relative" style="background: unset">
  <div class="overlay"></div>
  <div class="container">
    <div class="row justify-content-between align-items-center">
      <div class="col-lg-6 col-md-6 search-course-left">
        <h1 class="">
          Pendaftaran Online <br>
          Bergabung bersama kami!
        </h1>
        <p style="font-size: 0.85rem">
          Dengan Kurikulum yang update dengan kebutuhan kerja, kami menjamin lulusan akan mudah terserap didunia tenaga
          kerja
        </p>
      </div>
      <div class="col-lg-6 col-md-6 search-course-right section-gap">
        <h4 class="pb-20 text-center mb-30">Formulir Pendaftaran</h4>
        {!! Form::open(['url' => 'register', 'class' => 'form-wrap']) !!}
        {!! Form::text('nama_depan', '', ['class' => 'form-control', 'placeholder' => 'Nama Depan']) !!}
        {!! Form::text('nama_belakang', '', ['class' => 'form-control', 'placeholder' => 'Nama Belakang']) !!}
        {!! Form::textarea('alamat', '', ['class' => 'form-control', 'placeholder' => 'Alamat']) !!}
        <div class="form-select" id="service-select">
          {!! Form::select('jenis_kelamin', ['' => 'Pilih Jenis Kelamin', 'L' => 'Laki-laki', 'P' => 'Perempuan'], ['class' => 'form-select']) !!}
        </div>
        <div class="form-select" id="service-select">
          {!! Form::select('agama', ['Islam' => 'Islam', 'Kristen' => 'Kristen', 'Hindu' => 'Hindu', 'Buddha' => 'Buddha'], ['class' => 'form-select']) !!}
        </div>
        {!! Form::email('email', '', ['class' => 'form-control', 'placeholder' => 'Email']) !!}
        {!! Form::password('password', ['class' => 'form-control', 'placeholder' => 'Password']) !!}
        <button class="primary-btn text-uppercase">Submit</button>
        {!! Form::close() !!}
      </div>
    </div>
  </div>
</section>
@endsection