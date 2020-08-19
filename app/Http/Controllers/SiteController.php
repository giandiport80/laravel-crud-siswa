<?php

namespace App\Http\Controllers;

use App\Mail\NotifPendaftaranSiswa;
use App\Post;
use App\Siswa;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Str;

class SiteController extends Controller
{
    public function index()
    {
        $posts = Post::all();
        return view('sites.home', compact('posts'));
    }

    public function about()
    {
        return view('sites.about');
    }

    public function register()
    {
        return view('sites.register');
    }

    public function registerStore(Request $request)
    {
        $request->validate([
            'nama_depan' => 'required|min:3',
            'nama_belakang' => 'required|min:3',
            'jenis_kelamin' => 'required',
            'agama' => 'required',
            'alamat' => 'required|min:3',
            'email' => 'required|email|unique:users',
        ]);

        // buat user baru dari siswa ini
        $user = new User;
        $user->role = 'siswa';
        $user->name = $request->nama_depan;
        $user->email = $request->email;
        $user->password = bcrypt($request->password);
        $user->remember_token = Str::random(60);

        // dd($user);
        $user->save();

        // tambah user_id
        $request->request->add(['user_id' => $user->id]);

        Siswa::create($request->all());

        // *kirim email
        Mail::to($user->email)->send(new NotifPendaftaranSiswa);

        return redirect()->route('site.index')->with('pesan', 'Kamu Berhasil Mendaftar!');
    }

    public function singlePost($slug)
    {
        $post = Post::where('slug', $slug)->first();
        return view('sites.single_post', compact('post'));
    }
}
