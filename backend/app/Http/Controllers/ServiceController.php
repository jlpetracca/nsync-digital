<?php

namespace App\Http\Controllers;
use App\Helpers\ApiResponse;
use App\Services\TiendaNubeService;
use App\User;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ServiceController extends Controller {

	private $tiendaNube;

	public function __construct(){
		$this->tiendaNube = new TiendaNubeService();
	}

	/**
	 * @return \Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
	 */
	function doLoginTiendaNube(){
		return redirect(config('tiendaNube.url'));
    }

	/**
	 * @param Request $request
	 * @return JsonResponse
	 * @throws \TiendaNube\Auth\Exception
	 */
	public function tiendaNubeManager(Request $request){
        $credentials = [
            'clientId'     => config('tiendaNube.client_id'),
            'clientSecret' => config('tiendaNube.client_secret'),
            'code'         => $request['code']
        ];
        $this->tiendaNube->setAccessToken($credentials);
		$this->validateAndAuthUserTn();
        return ApiResponse::response(200, 'OK', null);
    }

	private function validateAndAuthUserTn(){
		$store = $this->tiendaNube->getStore();
		$this->tiendaNube->saveTiendaNubeStore();
	    if(!User::where('email', $store->body->email)->count()){
		    User::create([
			    'name'          => $store->body->name->es,
			    'email'         => $store->body->email,
			    'password'      => ApiResponse::generatePasswordForUser(),
			    'status'        => true,
			    'marketplace'   => config('tiendaNube.marketplace_id'),
			    'store_name'    => 'Nsync Digital'
		    ]);
		    $this->tiendaNube->getTnProducts();
	    }
		$user = User::where('email', $store->body->email)->first();
		Auth::login($user);
    }
    
}
