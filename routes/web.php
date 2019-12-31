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

Route::get('/', 'Utama@index');
Route::get('/Login', 'Login@index');
Route::post('/pushData', 'Utama@store');
Route::post('/Daftar', 'Login@Register');
Route::post('/Masuk', 'Login@Masuk');
Route::get('/Keluar', 'Login@Keluar');
Route::post('/AddCart', 'Order@Order');
Route::get('/Keranjang', 'Order@Keranjang');
Route::get('/hapusKeranjang', 'Order@hapusKeranjang');
Route::get('/Checkout', 'Order@CheckOut');
Route::get('/Checkout_List', 'Order@CheckOut_List');
Route::get('/Confirm', 'Order@Confirm');
Route::post('/Konfirm', 'Order@Confirm_Simpan');