<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateKomentarTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('komentar', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id');
            $table->string('konten');
            $table->foreignId('forum_id');
            $table->foreignId('parent')->default(0);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('komentar');
    }
}










// h: DOKUMENTASI
// kolom parent
// jika user membuat komentari forum, maka parent nya 0
// jika komentar dikomentari lagi, maka parent berisi id dari komentar yang dikomentari`

