@extends('templates.main')
@section('title', 'Laravel Crud Siswa')

@section('content')

<div class="panel">
    <div class="panel-heading">
        <h3 class="panel-title">Data Siswa</h3>
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

        <table class="table table-bordered table-hover">
            <thead class="text-center bg-info text-white">
                <th>No</th>
                <th>ID</th>
                <th>Title</th>
                <th>User</th>
                <th>Action</th>
            </thead>
            <tbody>
                @foreach ($posts as $post)
                <tr>
                    <td>{{ $loop->iteration }}</td>
                    <td>{{ $post->id }}</td>
                    <td>{{ $post->title }}</td>
                    <td>{{ $post->user->name }}</td>
                    <td>
                        <form action="{{ route('siswa.destroy', $post->id) }}" method="POST">
                            @csrf
                            @method('DELETE')

                            <a href="{{ route('site.singlePost', $post->slug) }}" target="_blank"
                                class="btn btn-info btn-sm" title="Edit data siswa">View</a>
                            <a href="/siswa/{{ $post->id }}/edit" class="btn btn-success btn-sm"
                                title="Edit data siswa">Edit</a>
                            <button type="submit" onclick="return confirm('yakin hapus {{ $post->title }}?')"
                                class="btn btn-danger btn-sm" title="Hapus data siswa">Hapus</button>
                        </form>
                    </td>
                </tr>
                @endforeach
            </tbody>
        </table>
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