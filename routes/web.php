<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', 'SiteController@index')->name('site.index');
Route::get('/about', 'SiteController@about')->name('site.about');
Route::get('/register', 'SiteController@register')->name('site.register');
Route::post('/register', 'SiteController@registerStore')->name('site.registerStore');

// Route::get('/', 'AuthController@login')->name('login');
Route::get('/login', 'AuthController@login')->name('login');
Route::post('/login', 'AuthController@authLogin')->name('auth.post');
Route::get('/logout', 'AuthController@authLogout')->name('auth.logout');



// yang mengakses route group ini hanya role admin
Route::group(['middleware' => ['auth', 'checkRole:admin']], function () {
    Route::get('/siswa', 'SiswaController@index')->name('siswa.index');
    Route::post('/siswa', 'SiswaController@store')->name('siswa.store');
    Route::get('/siswa/export', 'SiswaController@export')->name('siswa.export');
    Route::get('/siswa/pdf', 'SiswaController@pdf')->name('siswa.pdf');
    Route::get('/siswa/{siswa}', 'SiswaController@show')->name('siswa.show');
    // ! method hapus swal
    Route::get('/siswa/{siswa}/delete', 'SiswaController@delete')->name('siswa.delete');

    Route::post('/siswa/{siswa}/addnilai', 'SiswaController@addNilai')->name('siswa.addNilai');
    Route::get('/siswa/{siswa}/edit', 'SiswaController@edit')->name('siswa.edit');
    Route::patch('/siswa/{siswa}', 'SiswaController@update')->name('siswa.update');
    Route::delete('/siswa/{siswa}', 'SiswaController@destroy')->name('siswa.destroy');
    Route::delete('siswa/{siswa}/{idmapel}/deletenilai', 'SiswaController@deleteNilai');
    Route::get('/guru/{guru}', 'GuruController@show')->name('guru.show');
});


// yang mengakses route group ini hanya role admin dan siswa
Route::group(['middleware' => ['auth', 'checkRole:admin,siswa']], function () {
    Route::get('/dashboard', 'DashboardController@index')->name('dashboard.index');
});


// langkah buat middleware
// > php artisan make: