@extends('templates.main')
@section('title', 'Profile Siswa')

@push('styles')
<link href="//cdnjs.cloudflare.com/ajax/libs/x-editable/1.5.0/bootstrap3-editable/css/bootstrap-editable.css"
  rel="stylesheet" />
@endpush

@section('content')
<div class="panel panel-profile">
  <div class="clearfix">
    <!-- LEFT COLUMN -->
    <div class="profile-left">
      <!-- PROFILE HEADER -->
      <div class="profile-header">
        <div class="overlay"></div>
        <div class="profile-main">
          <img src="{{ $guru->getGambar() }}" class="img-circle" style="width: 90px" alt="Avatar">
          <h3 class="name">{{ $guru->nama }}</h3>
          <span class="online-status status-available">Available</span>
        </div>
      </div>
    </div>
    <!-- END LEFT COLUMN -->
    <!-- RIGHT COLUMN -->
    <div class="profile-right">
      @if (session('gagal'))
      <div class="alert alert-danger">
        <strong>{{ session('gagal') }}</strong>
      </div>
      @endif
      @if (session('pesan'))
      <div class="alert alert-success">
        <strong>{{ session('pesan') }}</strong>
      </div>
      @endif

      <div class="panel">
        <div class="panel-heading">
          <h3 class="panel-title">Mata Pelajaran yang diajarkan oleh guru <b>{{ $guru->nama }}:</b></h3>
        </div>
        <div class="panel-body">
          <table class="table table-striped">
            <thead>
              <tr>
                <th>No</th>
                <th>Mata Pelajaran</th>
                <th>Semester</th>
              </tr>
            </thead>
            <tbody>
              @foreach ($guru->mapel as $mapel)
              <tr>
                <td>{{ $loop->iteration }}</td>
                <td>{{ $mapel->nama }}</td>
                <td>{{ $mapel->semester }}</td>
              </tr>
              @endforeach
            </tbody>
          </table>
        </div>
      </div>
      <div class="panel">
        <div id="chartNilai"></div>
      </div>
    </div>
    <!-- END RIGHT COLUMN -->
  </div>
</div>

@endsection