<?php

namespace App\Http\Controllers;

use App\Siswa;
use Illuminate\Http\Request;

class SiswaController extends Controller
{
    public function index(Request $request)
    {
        if($request->cari){
            $siswa = Siswa::where('nama_depan', 'LIKE', '%'. $request->cari .'%')->get();
        }else{
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

        Siswa::create($request->all());

        return redirect()->route('siswa.index')->with('pesan', 'Data Siswa berhasil ditambahkan!');
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

        return redirect()->route('siswa.index')->with('pesan', 'Data Siswa berhasil diubah!');
    }

    public function destroy($id)
    {
        Siswa::destroy($id);

        return redirect()->route('siswa.index')->with('pesan', 'Data Siswa berhasil dihapus!');
    }
}
