<?php

namespace App\Http\Controllers;

use App\Siswa;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
    public function index()
    {
        return view('dashboard.index');
    }
}


// $sw = parameter untuk satu siswa

// ? ketarangan code
// public function index()
//     {
//         $siswa = Siswa::all();
        // * kita akan tambah satu property yaitu average /rata2 nilai ke atribut siswa,
        // *  yang isinya diambil dari function average() yang kita buat  
//         $siswa->map(function($sw){
            // * kita membuat property average pada setiap atribut siswa
            // * yang isinya dari function average() yang telah kita buat
//             $sw->average = $sw->average();
//             return $sw;
//         });

        // * kita akan mengurutkan siswa berd attr average asc
//         $siswa->sortBy('average');

//         dd($siswa);
//         return view('dashboard.index', compact('siswa'));

//     }


// function yang sama yang dipindah ke helper global.php
    // public function index()
    // {
    //     $siswa = Siswa::all();
    //     $siswa->map(function($sw){
    //         $sw->average = $sw->average();
    //         return $sw;
    //     });

        // * kita urutkan dari terbesar dan ambil 3 data
    //     $siswa = $siswa->sortByDesc('average')->take(3);

    //     return view('dashboard.index', compact('siswa'));
    // }