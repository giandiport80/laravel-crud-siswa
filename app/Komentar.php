<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Komentar extends Model
{
    protected $table = 'komentar';

    protected $guarded = ['id'];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function forum()
    {
        return $this->belongsTo(Forum::class);
    }

    public function childs()
    {
        return $this->hasMany(Komentar::class, 'parent');
    }
}










// h: DOKUMENTASI
// child()
// berelasi ke table komentari sendiri
// setiap komentar bisa punya child komentar
// parent adalah nama field nya
