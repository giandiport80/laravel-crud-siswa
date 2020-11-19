@extends('templates.main')
@section('title', 'Forum')

@section('content')

<div class="panel">
    <div class="panel-heading">
        <h3 class="panel-title">Forum Siswa</h3>
        <div class="right">
            <a  href="#" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" title="Tambah data Siswa">
                + Tambah forum
            </a>
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

        <ul class="list-unstyled activity-list">
            @foreach($forum as $fr)
            <li>
                <img src="{{ $fr->user->siswa->getGambar() }}" alt="Avatar" class="img-circle pull-left avatar">
                <p><a href="#">{{ $fr->user->siswa->nama_depan }}</a> : <a href="{{ route('forum.show', $fr) }}">{{ $fr->judul }}</a> <span
                        class="timestamp">{{ $fr->created_at->diffForHumans() }}</span>
                </p>
            </li>
            @endforeach
        </ul>
    </div>
</div>

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
                <form action="{{ route('forum.store') }}" method="POST">
                    @csrf

                    <div class="form-group @error('nama_depan') has-error @enderror">
                        <label for="judul">Judul</label>
                        <input type="text" name="judul" value="{{ old('judul') }}" class="form-control" id="judul">
                        @error('judul')
                        <small class="text-danger">{{ $message }}</small>
                        @enderror
                    </div>

                    <div class="form-group @error('content') has-error @enderror">
                        <label for="konten">Konten</label>
                        <textarea name="konten" class="form-control" value="{{ old('konten') }}" id="konten"
                            rows="3"></textarea>
                        @error('konten')
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
{{-- sweet alert --}}
<script>
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
</script>
@endpush
