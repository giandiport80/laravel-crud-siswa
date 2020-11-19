<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Siswa extends Model
{
    protected $table = 'siswa';

    protected $fillable = ['nama_depan', 'nama_belakang', 'jenis_kelamin', 'agama', 'alamat', 'gambar', 'user_id'];

    // custom function
    public function getGambar()
    {
        if (!$this->gambar) {
            return asset("storage/images/default.png");
        }

        return asset("storage/images/$this->gambar");
    }

    public function mapel()
    {
        return $this->belongsToMany(Mapel::class)->withPivot('nilai')->withTimestamps();
    }

    // contoh membuat custom function
    public function test()
    {
        return 'test';
    }

    // menghitung nilai rata2 siswa
    public function average()
    {
        if($this->mapel->isNotEmpty()){
            $total = 0;
            $hitung = 0;
            foreach($this->mapel as $mapel){
                $total += $mapel->pivot->nilai;
                $hitung++; // setiap adala pengulangan, hitung ditambah 1
            }

            return round($total / $hitung);
        }

        return 0;
    }

    public function namaLengkap()
    {
        return $this->nama_depan . ' ' . $this->nama_belakang;
    }

    public function user()
    {
        return $this->belongsTo(User::class)->withDefault(['gambar' => 'default.jpg']);
    }

}

// karena kolom nilai add di table pivot mapel_siswa, maka kita harus panggil dengan withPivot('nama_kolom')

// withTimestaps(), untuk mengisi kolom created_at dan updated_at pada table pivot
