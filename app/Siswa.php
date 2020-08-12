<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Siswa extends Model
{
    protected $table = 'siswa';

    protected $fillable = ['nama_depan', 'nama_belakang', 'jenis_kelamin', 'agama', 'alamat', 'gambar', 'user_id'];

    public function getGambar()
    {
        if (!$this->gambar) {
            return asset("storage/images/default.png");
        }

        return asset("storage/images/$this->gambar");
    }

    public function mapel()
    {
        return $this->belongsToMany(Mapel::class)->withPivot('nilai');
    }
}

// karena kolom nilai add di table pivot mapel_siswa, maka kita harus panggil dengan withPivot('nama_kolom')