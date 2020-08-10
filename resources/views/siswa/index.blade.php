@extends('templates.main')
@section('title', 'Laravel Crud Siswa')

@section('content')
@if (session('pesan'))
<div class="alert alert-success alert-dismissible fade show mt-3" role="alert">
  <strong>{{ session('pesan') }}</strong>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
@endif
<div class="row">
  <div class="col-md-6">
    <h1>Data Siswa</h1>
  </div>
  <div class="col-md-6">
    <button type="button" class="btn btn-primary btn-sm my-3 float-right" data-toggle="modal"
      data-target="#exampleModal" title="Tambah data Siswa">
      + Tambah
    </button>
  </div>
</div>
<table class="table table-bordered table-hover">
  <thead class="text-center bg-info text-white">
    <th>No</th>
    <th>Nama Depan</th>
    <th>Nama Belakang</th>
    <th>Jenis Kelamin</th>
    <th>Agama</th>
    <th>Alamat</th>
    <th>Aksi</th>
  </thead>
  <tbody>
    @foreach ($siswa as $sw)
    <tr>
      <td>{{ $loop->iteration }}</td>
      <td>{{ $sw->nama_depan }}</td>
      <td>{{ $sw->nama_belakang }}</td>
      <td>{{ $sw->jenis_kelamin }}</td>
      <td>{{ $sw->agama }}</td>
      <td>{{ $sw->alamat }}</td>
      <td>
        <form action="{{ route('siswa.destroy', $sw->id) }}" method="POST">
          @csrf
          @method('DELETE')

          <a href="/siswa/{{ $sw->id }}/edit" class="btn btn-success btn-sm" title="Edit data siswa">Edit</a>
          <button type="submit" onclick="return confirm('yakin hapus {{ $sw->nama_depan }}?')"
            class="btn btn-danger btn-sm" title="Hapus data siswa">Hapus</button>
        </form>
      </td>
    </tr>
    @endforeach
  </tbody>
</table>


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
        <form action="{{ route('siswa.store') }}" method="POST">
          @csrf

          <div class="form-group">
            <label for="nama_depan">Nama Depan</label>
            <input type="text" name="nama_depan" class="form-control" id="nama_depan">
          </div>

          <div class="form-group">
            <label for="nama_belakang">Nama Belakang</label>
            <input type="text" name="nama_belakang" class="form-control" id="nama_belakang">
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

          <div class="form-group">
            <label for="alamat">Alamat</label>
            <textarea name="alamat" class="form-control" id="alamat" rows="3"></textarea>
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