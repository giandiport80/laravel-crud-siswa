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
                            {{ $siswa->average() }} <span>Rata-rata Nilai</span>
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
            <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#tambahNilai"
                title="Tambah data Siswa">
                + Tambah Nilai
            </button>
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
                                <th>Guru</th>
                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($siswa->mapel as $mapel)
                            <tr>
                                <td>{{ $loop->iteration }}</td>
                                <td>{{ $mapel->kode }}</td>
                                <td>{{ $mapel->nama }}</td>
                                <td>{{ $mapel->semester }}</td>
                                <td><a href="#" class="nilai" data-type="text" data-pk="{{ $mapel->id }}"
                                        data-url="/api/siswa/{{ $siswa->id }}/editnilai"
                                        data-title="Masukkan Nilai">{{ $mapel->pivot->nilai }}</a></td>
                                <td><a href="{{ route('guru.show', $mapel->guru_id) }}">{{ $mapel->guru->nama }}</a>
                                </td>
                                <td>
                                    <form action="/siswa/{{ $siswa->id }}/{{ $mapel->id }}/deletenilai" method="POST">
                                        @csrf
                                        @method('DELETE')
                                        <button type="submit" onclick="return confirm('yakin hapus?')"
                                            class="btn btn-danger btn-sm" title="Hapus data siswa">Hapus</button>
                                    </form>
                                </td>
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

{{-- modal --}}
<div class="modal fade" id="tambahNilai" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="{{ route('siswa.addNilai', $siswa->id) }}" method="POST" enctype="multipart/form-data">
                    @csrf

                    <div class="form-group">
                        <label for="nama">Mata Pelajaran</label>
                        <select name="mapel" class="form-control" id="nama">
                            @foreach ($mataPelajaran as $mp)
                            <option value="{{ $mp->id }}">{{ $mp->nama }}</option>
                            @endforeach
                        </select>
                    </div>

                    <div class="form-group @error('nilai') has-error @enderror">
                        <label for="nilai">Nilai</label>
                        <input type="text" name="nilai" value="{{ old('nama_depan') }}" class="form-control"
                            id="nama_depan">
                        @error('nilai')
                        <small class="text-danger">{{ $message }}</small>
                        @enderror
                    </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary">Submit</button>
                </form>
            </div>
        </div>
    </div>
</div>

@endsection

@push('scripts')
<script src="//cdnjs.cloudflare.com/ajax/libs/x-editable/1.5.0/bootstrap3-editable/js/bootstrap-editable.min.js">
</script>
<script>
    // ketika aplikasi selesai diload, ambil semua id, aplikasikan editable()
  // id hanya menyeleksi satu element, bisa kita ganti dengan class agar bisa menyeleksi semua element
  $(document).ready(function() {
  $('.nilai').editable();
  });
</script>

<script src="https://code.highcharts.com/highcharts.js"></script>
<script>
    Highcharts.chart('chartNilai', {
    chart: {
    type: 'column'
    },
    title: {
    text: 'Laporan Nilai Siswa'
    },
    subtitle: {
    text: 'Source: WorldClimate.com'
    },
    xAxis: {
    categories: {!! json_encode($categories) !!},
    crosshair: true
    },
    yAxis: {
    min: 0,
    title: {
    text: 'Range Nilai'
    }
    },
    tooltip: {
      headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
      pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' + '<td style="padding:0"><b>{point.y:.1f}</b></td></tr>',
      footerFormat: '</table>',
      shared: true,
      useHTML: true
    },
    plotOptions: {
    column: {
    pointPadding: 0.2,
    borderWidth: 0
    }
    },
    series: [{
    name: 'Nilai',
    data: {!! json_encode($data) !!}
    
    }]
    });
</script>

@endpush