<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Post extends Model
{

    // mengubah format tanggal
    // agar laravel tau created_at ini adalah insatnce dari carbon
    // secara default, ini sudah bisa tanpa harus gunakan ini
    // kita bisa akses method format('d M Y')
    // protected $dates = ['created_at'];

    // mass asignment terjadi kalo kita pakai method ::create()
    protected $fillable = ['title', 'content', 'slug', 'user_id', 'tumbnail'];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function tumbnail()
    {
        return $this->tumbnail ? $this->tumbnail : asset("frontend/img/b1.jpg");
    }
}
