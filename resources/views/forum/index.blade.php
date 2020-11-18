@extends('templates.main')
@section('title', 'Forum')

@section('content')

<div class="panel">
    <div class="panel-heading">
        <h3 class="panel-title">Forum Siswa</h3>
        <div class="right">
            <a href="{{ route('post.create') }}" class="btn btn-primary btn-sm">+ Add Post</a>
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
                <p><a href="#">{{ $fr->user->siswa->nama_depan }}</a> : {{ $fr->judul }} <span
                        class="timestamp">{{ $fr->created_at->diffForHumans() }}</span>
                </p>
            </li>
            @endforeach
        </ul>
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
