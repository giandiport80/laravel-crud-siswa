<?php

namespace App\Http\Controllers;

use App\Siswa;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class SiswaController extends Controller
{
    public function index(Request $request)
    {
        if ($request->cari) {
            $siswa = Siswa::where('nama_depan', 'LIKE', '%' . $request->cari . '%')->get();
        } else {
            $siswa = Siswa::all();
        }
        return view('siswa.index', compact('siswa'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'nama_depan' => 'required|min:3',
            'nama_belakang' => 'required|min:3',
            'jenis_kelamin' => 'required',
            'agama' => 'required',
            'alamat' => 'required|min:3'
        ]);

        $siswa = Siswa::create($request->all());

        if ($request->file('gambar')) {
            $gambar = $request->gambar;
            $namaGambar = time() . $gambar->getClientOriginalName();
            
            Storage::putFileAs('public/images', $request->file('gambar'), $namaGambar);

            $siswa->gambar = $namaGambar;
            $siswa->save();
        }


        return redirect()->route('siswa.index')->with('pesan', 'Data Siswa berhasil ditambahkan!');
    }

    public function show($id)
    {
        $siswa = Siswa::findOrFail($id);
        return view('siswa.profile', compact('siswa'));
    }

    public function edit($id)
    {
        $siswa = Siswa::findOrFail($id);
        return view('siswa.edit', compact('siswa'));
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'nama_depan' => 'required|min:3',
            'nama_belakang' => 'required|min:3',
            'jenis_kelamin' => 'required',
            'agama' => 'required',
            'alamat' => 'required|min:3'
        ]);

        $siswa = Siswa::findOrFail($id);
        $siswa->update($request->all());

        if ($request->file('gambar')) {
            $gambar = $request->gambar;
            $namaGambar = time() . $gambar->getClientOriginalName();

            Storage::putFileAs('public/images', $request->file('gambar'), $namaGambar);

            $siswa->gambar = $namaGambar;
            $siswa->save();
        }


        
        return redirect()->route('siswa.index')->with('pesan', 'Data Siswa berhasil diubah!');
    }

    public function destroy($id)
    {
        $siswa = Siswa::findOrFail($id);

        if($siswa->gambar){
            Storage::delete("public/images/$siswa->gambar");
        }

        Siswa::destroy($id);

        return redirect()->route('siswa.index')->with('pesan', 'Data Siswa berhasil dihapus!');
    }
}
