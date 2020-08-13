<?php

namespace App\Http\Controllers;

use App\Siswa;
use Illuminate\Http\Request;

class ApiController extends Controller
{
    public function editNilai(Request $request, $id)
    {
        // return $request->all(); // ini akan muncul di network
        $siswa = Siswa:: findOrFail($id);
        $siswa->mapel()->updateExistingPivot($request->pk, ['nilai' => $request->value]);
    }
}
