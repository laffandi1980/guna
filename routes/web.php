<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CustomersController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\UsersController;
use App\Http\Controllers\DashboardController;
//use SebastianBergmann\CodeCoverage\Report\Html\Dashboard;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});
// Make sure that we have get and post methods for Grocery CRUD to work as expected
Route::get('customers/{operation?}/{id?}', [CustomersController::class, 'datagrid']);
Route::post('customers/{operation?}/{id?}', [CustomersController::class, 'datagrid']);

Route::get('users/{operation?}/{id?}', [UsersController::class, 'datagrid']);
Route::post('users/{operation?}/{id?}', [UsersController::class, 'datagrid']);

Route::get('login', [LoginController::class,'index'])->name('login');
Route::post('login-proses', [LoginController::class,'login_proses'])->name('login-proses');

Route::get('daftar/{operation?}/{id?}', [UsersController::class, 'registrasi'])->name('daftar');
Route::post('daftar/{operation?}/{id?}', [UsersController::class, 'registrasi'])->name('daftar');
Route::get('mendaftar/{operation?}/{id?}', [UsersController::class, 'mendaftar'])->name('mendaftar');

Route::get('dashboard/{operation?}/{id?}', [DashboardController::class, 'dashboard'])->name('dashboard');
Route::post('dashboard/{operation?}/{id?}', [DashboardController::class, 'dashboard'])->name('dashboard');
