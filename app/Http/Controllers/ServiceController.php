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
		return redirect($this->tiendaNube::URL_TIENDA_NUBE);
    }

	/**
	 * @param Request $request
	 * @return JsonResponse
	 * @throws \TiendaNube\Auth\Exception
	 */
	public function tiendaNubeManager(Request $request){
        $credentials = [
            'clientId'     => $this->tiendaNube::CLIENT_ID_TIENDA_NUBE,
            'clientSecret' => $this->tiendaNube::CLIENT_SECRET_TIENDA_NUBE,
            'code'         => $request['code']
        ];
        $this->tiendaNube->setAccessToken($credentials);
		$this->validateAndAuthUserTn();
        return ApiResponse::response(200, 'OK', null);
    }

	private function validateAndAuthUserTn(){
		$store = $this->tiendaNube->getStore();
	    if(!User::where('email', $store->body->email)->count()){
			    User::create([
				    'name'          => $store->body->name->es,
				    'email'         => $store->body->email,
				    'password'      => ApiResponse::generatePasswordForUser(),
				    'status'        => true,
				    'marketplace'   => $this->tiendaNube::MARKETPLACE_ID,
				    'store_name'    => 'Tienda Nube'
			    ]);
			    $this->tiendaNube->saveTiendaNubeStore();
			    $this->tiendaNube->getTnProducts();
	    }
			$user = User::where('email', $store->body->email)->first();
			Auth::login($user);
    }
}
