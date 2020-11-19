@extends('templates.main')
@section('title', 'Forum')

@section('content')
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
<div class="row">
    <div class="col-md-12">
        <!-- PANEL HEADLINE -->
        <div class="panel panel-headline">
            <div class="panel-heading">
                <h3 class="panel-title">{{ $forum->judul }}</h3>
                <p class="panel-subtitle">{{ $forum->created_at->diffForHumans() }}</p>
            </div>
            <div class="panel-body">
                <p>{{ $forum->konten }}</p>
                <hr>
                <div class="btn-group">
                    <button class="btn btn-default"><i class="lnr lnr-thumbs-up"></i> suka</button>
                    <button class="btn btn-default" id="btn-komentar-utama"><i class="lnr lnr-bubble"></i>
                        komentar</button>
                </div>

                <div>
                    @error('konten')
                    <small class="text-danger">{{ $message }}</small>
                    @enderror
                </div>

                <form action="" method="POST" style="margin-top: 2rem; display: none" id="komentar-utama">
                    @csrf

                    <input type="hidden" name="forum_id" value="{{ $forum->id }}">
                    <input type="hidden" name="parent" value="0">

                    <textarea name="konten" class="form-control" rows="4"></textarea>
                    <button style="margin-top: 2rem" type="submit" class="btn btn-primary">Kirim</button>
                </form>

                <h3>Komentar</h3>
                <ul class="list-unstyled activity-list">
                    <li>
                        <img src="assets/img/user1.png" alt="Avatar" class="img-circle pull-left avatar">
                        <p><a href="#">Michael</a> has achieved 80% of his completed tasks <span class="timestamp">20
                                minutes ago</span>
                        </p>
                    </li>
                    <li>
                        <img src="assets/img/user2.png" alt="Avatar" class="img-circle pull-left avatar">
                        <p><a href="#">Daniel</a> has been added as a team member to project <a href="#">System
                                Update</a> <span class="timestamp">Yesterday</span></p>
                    </li>
                    <li>
                        <img src="assets/img/user3.png" alt="Avatar" class="img-circle pull-left avatar">
                        <p><a href="#">Martha</a> created a new heatmap view <a href="#">Landing Page</a> <span
                                class="timestamp">2 days
                                ago</span></p>
                    </li>
                    <li>
                        <img src="assets/img/user4.png" alt="Avatar" class="img-circle pull-left avatar">
                        <p><a href="#">Jane</a> has completed all of the tasks <span class="timestamp">2 days ago</span>
                        </p>
                    </li>
                    <li>
                        <img src="assets/img/user5.png" alt="Avatar" class="img-circle pull-left avatar">
                        <p><a href="#">Jason</a> started a discussion about <a href="#">Weekly Meeting</a> <span
                                class="timestamp">3
                                days ago</span></p>
                    </li>
                </ul>
            </div>
        </div>
        <!-- END PANEL HEADLINE -->
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
    $(function () {

      $('#btn-komentar-utama').on('click', function(){
        $('#komentar-utama').toggle('slide');
      })

    });


</script>
@endpush
