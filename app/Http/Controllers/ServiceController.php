<?php

namespace App\Http\Controllers;
use App\Helpers\ApiResponse;
use App\Jobs\ProcessProducts;
use App\Services\TiendaNubeService;
use App\User;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Password;
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
		$this->validateUser();
        return ApiResponse::response(200, 'OK', null);
    }
    
	private function validateUser(){
		$store = $this->tiendaNube->getStore();
	    if(User::where('email', $store->body->email)->count()){
		    $user = User::where('email', $store->body->email)->first();
		    Auth::login($user);
	    }
	    else{
		    User::create([
		    	'name'          => $store->body->name->es,
			    'email'         => $store->body->email,
			    'password'      => $this->generatePasswordForUser(),
			    'status'        => true,
			    'marketplace'   => $this->tiendaNube::MARKETPLACE_ID,
			    'store_name'    => 'Tienda Nube'
		    ]);
		    $this->tiendaNube->getWebHook();
		    $this->tiendaNube->saveTiendaNubeStore();
		    //$this->tiendaNube->syncProducts();
		    $job = new ProcessProducts($this->tiendaNube);
		    $job->delay(30);
	    }
    }
	
	/**
	 * @return string
	 */
	private function generatePasswordForUser(){
	    $passwordGenerated = Password::getRepository()->createNewToken();
	    return Hash::make($passwordGenerated);
    }

}
