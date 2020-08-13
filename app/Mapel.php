<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Mapel extends Model
{
    protected $table = "mapel";
    protected $fillable = ['kode', 'nama', 'semester'];

    public function siswa()
    {
        return $this->belongsToMany(Siswa::class)->withPivot('nilai');
    }

    // banyak mapel dimiliki oleh satu guru
    public function guru()
    {
        return $this->belongsTo(Guru::class);
    }
}

// karena kolom nilai add di table pivot mapel_siswa, maka kita harus panggil dengan withPivot('nama_kolom')