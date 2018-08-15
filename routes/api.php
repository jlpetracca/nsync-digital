<?php

use Illuminate\Http\Request;
use App\Services\BackgroundProcessTn;
use App\tnStore;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('/backgroundTn', function () {
	$stores = tnStore::all()->where('app_status', 1)->all();
	$backgroundProcess = new BackgroundProcessTn();
	foreach ($stores as $store){
		$backgroundProcess->backgroundProcess($store->id, $store->token);
	}
});
