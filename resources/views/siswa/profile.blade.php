@extends('templates.main')
@section('title', 'Profile Siswa')

@section('content')
<div class="panel panel-profile">
  <div class="clearfix">
    <!-- LEFT COLUMN -->
    <div class="profile-left">
      <!-- PROFILE HEADER -->
      <div class="profile-header">
        <div class="overlay"></div>
        <div class="profile-main">
          <img src="{{ $siswa->getGambar() }}" class="img-circle" style="width: 90px" alt="Avatar">
          <h3 class="name">{{ $siswa->nama_depan }}</h3>
          <span class="online-status status-available">Available</span>
        </div>
        <div class="profile-stat">
          <div class="row">
            <div class="col-md-4 stat-item">
              {{ $siswa->mapel->count() }} <span>Mata Pelajaran</span>
            </div>
            <div class="col-md-4 stat-item">
              15 <span>Awards</span>
            </div>
            <div class="col-md-4 stat-item">
              2174 <span>Points</span>
            </div>
          </div>
        </div>
      </div>
      <!-- END PROFILE HEADER -->
      <!-- PROFILE DETAIL -->
      <div class="profile-detail">
        <div class="profile-info">
          <h4 class="heading">Detail Data diri</h4>
          <ul class="list-unstyled list-justify">
            <li>Jenis Kelamin <span>{{ $siswa->jenis_kelamin }}</span></li>
            <li>Agama <span>{{ $siswa->agama }}</span></li>
            <li>Alamat <span>{{ $siswa->alamat }}</span></li>
          </ul>
        </div>
        <div class="text-center">
          <a href="{{ route('siswa.edit', $siswa->id) }}" class="btn btn-success">Edit Profile</a>
        </div>
      </div>
      <!-- END PROFILE DETAIL -->
    </div>
    <!-- END LEFT COLUMN -->
    <!-- RIGHT COLUMN -->
    <div class="profile-right">
      <div class="panel">
        <div class="panel-heading">
          <h3 class="panel-title">Mata Pelajaran</h3>
        </div>
        <div class="panel-body">
          <table class="table table-striped">
            <thead>
              <tr>
                <th>No</th>
                <th>Kode</th>
                <th>Nama</th>
                <th>Semester</th>
                <th>Nilai</th>
              </tr>
            </thead>
            <tbody>
              @foreach ($siswa->mapel as $mapel)
              <tr>
                <td>{{ $loop->iteration }}</td>
                <td>{{ $mapel->kode }}</td>
                <td>{{ $mapel->nama }}</td>
                <td>{{ $mapel->semester }}</td>
                <td>{{ $mapel->pivot->nilai }}</td> {{-- nilai ada di table pivot --}}
              </tr>
              @endforeach
            </tbody>
          </table>
        </div>
      </div>
    </div>
    <!-- END RIGHT COLUMN -->
  </div>
</div>
@endsection