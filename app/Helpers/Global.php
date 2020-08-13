<?php

use App\Guru;
use App\Siswa;

// kita bisa panggil function ini tanpa harus melempar data terlebih dahulu view nye
function ranking3Besar()
{
  $siswa = Siswa::all();
  $siswa->map(function ($sw) {
    $sw->average = $sw->average();
    return $sw;
  });

  // kita urutkan dari terbesar dan ambil 3 data
  $siswa = $siswa->sortByDesc('average')->take(3);
  return $siswa;
}

// function menghitung jumlah siswa
function totalSiswa()
{
  return Siswa::count();
}

// function menghitung jumlah Guru
function totalGuru()
{
  return Guru::count();
}