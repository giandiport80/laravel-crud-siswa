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

Route::get('/', function () {
    return view('home');
});

Route::get('/login', 'AuthController@login')->name('login');
Route::post('/login', 'AuthController@authLogin')->name('auth.post');
Route::get('/logout', 'AuthController@authLogout')->name('auth.logout');


// yang mengakses route group ini hanya role admin
Route::group(['middleware' => ['auth', 'checkRole:admin']], function () {
    Route::get('/siswa', 'SiswaController@index')->name('siswa.index');
    Route::post('/siswa', 'SiswaController@store')->name('siswa.store');
    Route::get('/siswa/{siswa}', 'SiswaController@show')->name('siswa.show');
    Route::post('/siswa/{siswa}/addnilai', 'SiswaController@addNilai')->name('siswa.addNilai');
    Route::get('/siswa/{siswa}/edit', 'SiswaController@edit')->name('siswa.edit');
    Route::patch('/siswa/{siswa}', 'SiswaController@update')->name('siswa.update');
    Route::delete('/siswa/{siswa}', 'SiswaController@destroy')->name('siswa.destroy');
});


// yang mengakses route group ini hanya role admin dan siswa
Route::group(['middleware' => ['auth', 'checkRole:admin,siswa']], function () {
    Route::get('/dashboard', 'DashboardController@index')->name('dashboard.index');
});


// langkah buat middleware
// > php artisan make: