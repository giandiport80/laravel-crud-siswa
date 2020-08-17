<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Model;
use App\Siswa;
use Faker\Generator as Faker;

$factory->define(Siswa::class, function (Faker $faker) {
    return [
        'user_id' => $faker->numberBetween(10, ),
        'nama_depan' => $faker->name,
        'nama_belakang' => $faker->lastName,
        'jenis_kelamin' => $faker->randomElement(['L', 'P']),
        'agama' => $faker->randomElement(['Islam', 'Kristen', 'Hindu', 'Buddha']),
        'alamat' => $faker->address
    ];
});
