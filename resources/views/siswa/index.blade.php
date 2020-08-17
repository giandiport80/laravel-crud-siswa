@extends('templates.main')
@section('title', 'Laravel Crud Siswa')

@section('content')

<div class="panel">
  <div class="panel-heading">
    <h3 class="panel-title">Data Siswa</h3>
    <div class="right">
      <a href="{{ route('siswa.export') }}" class="btn btn-success btn-sm">Export Excel</a>
      <a href="{{ route('siswa.pdf') }}" class="btn btn-danger btn-sm">Export PDF</a>
      <button type="button" class="" data-toggle="modal" data-target="#exampleModal" title="Tambah data Siswa">
        <i class="lnr lnr-plus-circle"></i>
      </button>
    </div>
  </div>
  <div class="panel-body">
    @if (session('gagal'))
    <div class="alert alert-success">
      <strong>{{ session('gagal') }}</strong>
    </div>
    @endif
    @if (session('pesan'))
    <div class="alert alert-success">
      <strong>{{ session('pesan') }}</strong>
    </div>
    @endif

    <table class="table table-bordered table-hover" id="datatable">
      <thead class="text-center bg-info text-white">
        <th>Nama Lengkap</th>
        <th>Jenis Kelamin</th>
        <th>Agama</th>
        <th>Alamat</th>
        <th>Rata-rata nilai</th>
        <th>Aksi</th>
      </thead>
      <tbody>
        {{-- yajra datatable --}}
      </tbody>
    </table>
  </div>
</div>




<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="{{ route('siswa.store') }}" method="POST" enctype="multipart/form-data">
          @csrf

          <div class="form-group @error('nama_depan') has-error @enderror">
            <label for="nama_depan">Nama Depan</label>
            <input type="text" name="nama_depan" value="{{ old('nama_depan') }}" class="form-control" id="nama_depan">
            @error('nama_depan')
            <small class="text-danger">{{ $message }}</small>
            @enderror
          </div>

          <div class="form-group @error('nama_belakang') has-error @enderror">
            <label for="nama_belakang">Nama Belakang</label>
            <input type="text" name="nama_belakang" value="{{ old('nama_belakang') }}" class="form-control" id="nama_belakang">
            @error('nama_belakang')
            <small class="text-danger">{{ $message }}</small>
            @enderror
          </div>

          <div class="form-group @error('email') has-error @enderror">
            <label for="email">Email</label>
            <input type="email" name="email" value="{{ old('email') }}" class="form-control" id="email">
            @error('email')
            <small class="text-danger">{{ $message }}</small>
            @enderror
          </div>

          <div class="form-group">
            <label for="jenis_kelamin">Jenis Kelamin</label>
            <select name="jenis_kelamin" class="form-control" id="jenis_kelamin">
              <option value="L">Laki-laki</option>
              <option value="P">Perempuan</option>
            </select>
          </div>

          <div class="form-group">
            <label for="agama">Agama</label>
            <select name="agama" class="form-control" id="agama">
              <option value="Islam">Islam</option>
              <option value="Kristen">Kristen</option>
              <option value="Hindu">Hindu</option>
              <option value="Buddha">Buddha</option>
            </select>
          </div>

          <div class="form-group @error('alamat') has-error @enderror">
            <label for="alamat">Alamat</label>
            <textarea name="alamat" class="form-control" value="{{ old('alamat') }}" id="alamat" rows="3"></textarea>
            @error('alamat')
            <small class="text-danger">{{ $message }}</small>
            @enderror
          </div>

          <div class="form-group @error('gambar') has-error @enderror">
            <label for="gambar">Gambar</label>
            <input type="file" name="gambar" class="form-control" id="gambar">
            <small class="text-info">Max size of image 512 KB</small><br>
            @error('gambar')
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

<script>
$(document).ready(function () {
  // datatable
  $('#datatable').DataTable({
    processing: true,
    serverside: true,
    ajax: "{{ route('siswa.ajax') }}",
    columns: [
      {data: 'nama_lengkap', name: 'nama_lengkap'},
      {data: 'jenis_kelamin', name: 'jenis_kelamin'},
      {data: 'agama', name: 'agama'},
      {data: 'alamat', name: 'alamat'},
      {data: 'average', name: 'average'},
      {data: 'aksi', name: 'aksi'},
    ]
  })

  // sweet alert
  $('.delete').click(function(){
    const siswaId = $(this).attr('siswa-id');

    Swal.fire({
    title: 'Apakah Kamu Yakin?',
    text: `Hapus data siswa dengan id = ${siswaId}?`,
    icon: 'warning',
    showCancelButton: true,
    confirmButtonColor: '#3085d6',
    cancelButtonColor: '#d33',
    confirmButtonText: 'Yes, delete it!'
    }).then((result) => {
      if (result.value) {
        window.location = `/siswa/${siswaId}/delete`
      }
    })

  })

});

  </script>
@endpush