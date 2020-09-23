@extends('templates.main')
@section('title', 'Laravel Crud Siswa')

@push('styles')
<style>
    .ck-editor__editable_inline {
        min-height: 300px;
    }
</style>
@endpush

@section('content')

<div class="panel">
    <div class="panel-heading">
        <h3 class="panel-title">Add New Post</h3>
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

        <div class="row">
            <div class="col-md-8">
                <form action="{{ route('post.store') }}" method="POST" enctype="multipart/form-data">
                    @csrf

                    <div class="form-group @error('title') has-error @enderror">
                        <label for="title">Title</label>
                        <input type="text" name="title" value="{{ old('title') }}" class="form-control" id="title">
                        @error('title')
                        <small class="text-danger">{{ $message }}</small>
                        @enderror
                    </div>

                    <div class="form-group @error('content') has-error @enderror">
                        <label for="content">Content</label>
                        <textarea name="content" class="form-control" value="{{ old('content') }}" id="content"
                            rows="3"></textarea>
                        @error('content')
                        <small class="text-danger">{{ $message }}</small>
                        @enderror
                    </div>

                    <button type="submit" class="btn btn-primary btn-sm">Submit</button>


            </div>
            <div class="col-md-4">
                {{-- tombol laravel file manager --}}
                <div class="input-group">
                    <span class="input-group-btn">
                        <a id="lfm" data-input="thumbnail" data-preview="holder" class="btn btn-primary">
                            <i class="fa fa-picture-o"></i> Choose
                        </a>
                    </span>
                    <input id="thumbnail" class="form-control" type="text" name="tumbnail">
                </div>
                <img id="holder" style="margin-top:15px;max-height:100px;">
            </div>

            </form>
        </div>

    </div>
</div>
@endsection

@push('scripts')
<script src="{{ asset('frontend/js/ckeditor.js') }}"></script>
<script src="{{ asset('/vendor/laravel-filemanager/js/stand-alone-button.js') }}"></script>

<script>
    ClassicEditor
          .create( document.querySelector( '#content' ) )
          .catch( error => {
          console.error( error );
          } );
    
      $(document).ready(function () {  
        $('#lfm').filemanager('image'); // laravel file manager
      });
</script>
@endpush