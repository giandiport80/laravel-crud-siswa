<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Siswa extends Model
{
    protected $table = 'siswa';

    protected $fillable = ['nama_depan', 'nama_belakang', 'jenis_kelamin', 'agama', 'alamat', 'gambar'];

    public function getGambar()
    {
        if (!$this->gambar) {
            return asset("storage/images/default.png");
        }

        return asset("storage/images/$this->gambar");
    }
}
