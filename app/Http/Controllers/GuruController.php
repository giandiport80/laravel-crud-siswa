<?php

namespace App\Http\Controllers;

use App\Guru;
use Illuminate\Http\Request;

class GuruController extends Controller
{
    public function show($id)
    {
        $guru = Guru::findOrFail($id);
        return view('guru.profile', compact('guru'));
    }
}
