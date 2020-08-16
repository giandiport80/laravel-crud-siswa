<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Cviebrock\EloquentSluggable\Sluggable;

class Post extends Model
{
    use Sluggable;

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
    

    /**
     * Return the sluggable configuration array for this model.
     *
     * @return array
     */
    public function sluggable()
    {
        return [
            'slug' => [
                'source' => 'title'
            ]
        ];
    }

    public function tumbnail()
    {
        return $this->tumbnail ? $this->tumbnail : asset("frontend/img/b1.jpg");
    }
}
