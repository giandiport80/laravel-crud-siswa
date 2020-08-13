<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Guru extends Model
{
    protected $table = 'guru';
    protected $fillable = ['nama', 'telepon', 'alamat'];

    // satu guru memiliki banyak mapel
    public function mapel()
    {
        return $this->hasMany(Mapel::class);
    }

    public function getGambar()
    {
        if (!$this->gambar) {
            return asset("storage/images/default.png");
        }

        return asset("storage/images/$this->gambar");
    }
}
