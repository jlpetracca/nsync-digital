<?php

namespace App\Http\Controllers;
use App\Helpers\ApiResponse;
use App\Services\TiendaNubeService;
use App\User;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Password;
use Illuminate\Support\Facades\Auth;

class ServiceController extends Controller {
	
	const URL_TIENDA_NUBE = 'https://www.tiendanube.com/apps/668/authorize';
	const CLIENT_ID_TIENDA_NUBE = '668';
	const CLIENT_SECRET_TIENDA_NUBE = '0d1RCsc673OHbquxcts3JJv26NdkIUV0sQ4I8ZuUpI1RU2gz';
	const MARKETPLACE_ID = 1;
	
	/**
	 * @return \Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
	 */
	function doLoginTiendaNube(){
		return redirect(self::URL_TIENDA_NUBE);
    }
	
	/**
	 * @param Request $request
	 * @return JsonResponse
	 * @throws \TiendaNube\Auth\Exception
	 */
	public function tiendaNube(Request $request){
        $credentials = [
            'clientId'     => self::CLIENT_ID_TIENDA_NUBE,
            'clientSecret' => self::CLIENT_SECRET_TIENDA_NUBE,
            'code'         => $request['code']
        ];
        $tiendaNubeService = new TiendaNubeService();
        $tiendaNubeService->setAccessToken($credentials);
		$this->validateUser($tiendaNubeService);
        return ApiResponse::response(200, 'OK', null);
    }
	
	/**
	 * @param TiendaNubeService $tiendaNubeService
	 */
	private function validateUser(TiendaNubeService $tiendaNubeService){
		$store = $tiendaNubeService->getStore();
	    $passwordGenerated = Password::getRepository()->createNewToken();
	    $passwordForNewUser = Hash::make($passwordGenerated);
	    if(User::where('email', $store->body->email)->count()){
		    $user = User::where('email', $store->body->email)->first();
		    Auth::login($user);
	    }
	    else{
		    User::create([
		    	'name'          => $store->body->name->es,
			    'email'         => $store->body->email,
			    'password'      => $passwordForNewUser,
			    'status'        => true,
			    'marketplace'   => self::MARKETPLACE_ID,
			    'store_name'    => 'Tienda Nube'
		    ]);
		    $tiendaNubeService->getWebHook();
		    $tiendaNubeService->saveTiendaNubeStore();
		    $tiendaNubeService->syncProducts();
	    }
    }

}
