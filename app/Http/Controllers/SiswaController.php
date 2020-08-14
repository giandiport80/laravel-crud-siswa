<?php

namespace App\Http\Controllers;

use App\Exports\SiswaExport;
use App\Mapel;
use App\Siswa;
use App\User;
use Barryvdh\DomPDF\Facade as PDF; // ini udah dimodifikasi
use Illuminate\Http\Request;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
use Maatwebsite\Excel\Facades\Excel;

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
            'alamat' => 'required|min:3',
            'email' => 'required|email|unique:users',
            'gambar' => 'image|between:0,512|mimes:jpeg,png,jpg',
        ]);

        // buat user baru dari siswa ini
        $user = new User;
        $user->role = 'siswa';
        $user->name = $request->nama_depan;
        $user->email = $request->email;
        $user->password = bcrypt('password');
        $user->remember_token = Str::random(60);

        $user->save();

        // tambah user_id
        $request->request->add(['user_id' => $user->id]);

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

    public function show(Siswa $siswa)
    {
        // $siswa = Siswa::findOrFail($id);
        $mataPelajaran = Mapel::all();

        // menyiapkan data untuk chart
        $categories = [];
        $data = [];
        foreach($mataPelajaran as $mp){
            // cek apakah siswa punya nilai di semua mapel, setidaknya satu (->first()) nilai mapel
            if($siswa->mapel()->wherePivot('mapel_id', $mp->id)->first()){
                $categories[] = $mp->nama;
                $data[] = $siswa->mapel()->wherePivot('mapel_id', $mp->id)->first()->pivot->nilai;
            }
        }

        // dd($data);
        // dd(json_encode($categories));

        return view('siswa.profile', compact('siswa', 'mataPelajaran', 'categories', 'data'));
    }

    public function edit(Siswa $siswa)
    {
        // $siswa = Siswa::findOrFail($id);
        return view('siswa.edit', compact('siswa'));
    }

    public function update(Request $request, Siswa $siswa)
    {
        $request->validate([
            'nama_depan' => 'required|min:3',
            'nama_belakang' => 'required|min:3',
            'jenis_kelamin' => 'required',
            'agama' => 'required',
            'alamat' => 'required|min:3',
            'gambar' => 'image|between:0,512|mimes:jpeg,png,jpg'
        ]);

        // $siswa = Siswa::findOrFail($id);
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

    public function destroy(Siswa $siswa)
    {
        // $siswa = Siswa::findOrFail($id);

        if($siswa->gambar){
            Storage::delete("public/images/$siswa->gambar");
        }

        Siswa::destroy($siswa->id);

        return redirect()->route('siswa.index')->with('pesan', 'Data Siswa berhasil dihapus!');
    }

    public function addNilai(Request $request, Siswa $siswa)
    {
        // $siswa = Siswa::findOrFail($id);
        if($siswa->mapel()->where('mapel_id', $request->mapel)->exists()){
            return redirect()->route('siswa.show', $siswa->id)->with('gagal', 'Data nilai sudah ada!');
        }

        $siswa->mapel()->attach($request->mapel, ['nilai' => $request->nilai]);

        return redirect()->route('siswa.show', $siswa->id)->with('pesan', 'Data nilai berhasil dimasukkan!');
    }

    public function deleteNilai(Siswa $siswa, $idmapel)
    {
        // $siswa = Siswa::findOrFail($idsiswa);
        $siswa->mapel()->detach($idmapel);
        
        return redirect()->back()->with('pesan', 'Data Nilai Berhasil dihapus!');
    }

    // * function export excel
    public function export()
    {
        return Excel::download(new SiswaExport, 'Siswa.xlsx');
    }

    // * function untuk export pdf
    public function pdf()
    {
        // ? bisa pake yang ini
        // $pdf = App::make('dompdf.wrapper');
        // $pdf->loadHTML('<h1>Test</h1>');
        // return $pdf->stream();

        $siswa = Siswa::all();
        $pdf = PDF::loadView('export.siswapdf', ['siswa' => $siswa]);
        return $pdf->download('siswa.pdf');
    }

    public function delete(Siswa $siswa)
    {
        $siswa->delete($siswa);

        return redirect()->route('siswa.index')->with('pesan', 'Data Siswa berhasil dihapus!');
    }
}

//$siswa->mapel()->attach($request->mapel, ['nilai' => $request->nilai])
//  ? ['nilai' => $request->nilai]
// kita menambahkan pada kolom nilai pada table pivot dari mapel_siswa