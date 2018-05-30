<?php

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
    return view('welcome');
});

Route::post('/loginTn', 'ServiceController@doLoginTiendaNube')->name('loginTn');
Route::get('/tiendaNube', 'ServiceController@tiendaNube');

Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});
