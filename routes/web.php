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

Route::group(['middleware' => ['auth']], function () {
    Route::get('/dashboard', 'DashboardController@index')->name('dashboard.index');
    Route::get('/siswa', 'SiswaController@index')->name('siswa.index');
    Route::post('/siswa', 'SiswaController@store')->name('siswa.store');
    Route::get('/siswa/{siswa}', 'SiswaController@show')->name('siswa.show');
    Route::get('/siswa/{siswa}/edit', 'SiswaController@edit')->name('siswa.edit');
    Route::patch('/siswa/{siswa}', 'SiswaController@update')->name('siswa.update');
    Route::delete('/siswa/{siswa}', 'SiswaController@destroy')->name('siswa.destroy');
});