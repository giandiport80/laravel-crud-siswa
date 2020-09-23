@extends('templates.main')
@section('title', 'Edit Data Siswa')

@section('content')
<div class="row">
    <div class="col-md-6">
        <h1>Edit Data Siswa</h1>
        <form action="{{ route('siswa.update', $siswa->id) }}" method="POST" enctype="multipart/form-data">
            @csrf
            @method('PATCH')

            <div class="form-group @error('nama_depan') has-error @enderror">
                <label for="nama_depan">Nama Depan</label>
                <input type="text" name="nama_depan" value="{{ $siswa->nama_depan }}" class="form-control"
                    id="nama_depan">
                @error('nama_depan')
                <small class="text-danger">{{ $message }}</small>
                @enderror
            </div>

            <div class="form-group @error('nama_belakang') has-error @enderror">
                <label for="nama_belakang">Nama Belakang</label>
                <input type="text" name="nama_belakang" value="{{ $siswa->nama_belakang }}" class="form-control"
                    id="nama_belakang">
                @error('nama_belakang')
                <small class="text-danger">{{ $message }}</small>
                @enderror
            </div>

            <div class="form-group">
                <label for="jenis_kelamin">Jenis Kelamin</label>
                <select name="jenis_kelamin" class="form-control" id="jenis_kelamin">
                    <option value="L" @if($siswa->jenis_kelamin == 'L') selected @endif >Laki-laki</option>
                    <option value="P" @if($siswa->jenis_kelamin == 'P') selected @endif >Perempuan</option>
                </select>
            </div>

            <div class="form-group">
                <label for="agama">Agama</label>
                <select name="agama" class="form-control" id="agama">
                    <option value="Islam" @if($siswa->agama == 'Islam') selected @endif >Islam</option>
                    <option value="Kristen" @if($siswa->agama == 'Kristen') selected @endif >Kristen</option>
                    <option value="Hindu" @if($siswa->agama == 'Hindu') selected @endif >Hindu</option>
                    <option value="Buddha" @if($siswa->agama == 'Buddha') selected @endif >Buddha</option>
                </select>
            </div>

            <div class="form-group @error('alamat') has-error @enderror">
                <label for="alamat">Alamat</label>
                <textarea name="alamat" class="form-control" id="alamat" rows="3">{{ $siswa->alamat }}</textarea>
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

            <button type="submit" class="btn btn-primary btn-sm">Update</button>
        </form>

    </div>
</div>
@endsection