<?php

namespace App\Http\Controllers;
use App\Helpers\ApiResponse;
use App\Services\ServiceFactory;
use App\User;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Password;

class ServiceController extends Controller
{

    /**
     * @return JsonResponse
     */
    public function magento(): JsonResponse
    {
        $credentials = [
            'username' => config('magento.username'),
            'password' => config('magento.password'),
            'url'      => config('magento.url')
        ];
        $magentoService = ServiceFactory::getService('magento', $credentials);
        return ApiResponse::response(200, 'Ok', $magentoService->getToken());
    }
	
	/**
	 * @return \Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
	 */
	function doLoginTiendaNube(){
		return redirect('https://www.tiendanube.com/apps/668/authorize');
    }

    /**
     * @param Request $request
     * @return JsonResponse
     */
    public function tiendaNube(Request $request){
        $credentials = [
            'clientId'     => '668',
            'clientSecret' => '0d1RCsc673OHbquxcts3JJv26NdkIUV0sQ4I8ZuUpI1RU2gz',
            'code'         => $request['code']
        ];
        $tiendaNubeService = ServiceFactory::getService('tiendaNube', $credentials);
        $accessToken = $tiendaNubeService->getToken();
        $store = $tiendaNubeService->getStore($accessToken);
	    $tokenToLogin = Password::getRepository()->createNewToken();
	    $password = Hash::make($tokenToLogin);
	    if(User::where('email', $store->body->email)->count()){
		    $user = User::where('email', $store->body->email)->first();
		    \Illuminate\Support\Facades\Auth::login($user);
	    	dd('it works');
	    }
	    User::create(['name' => $store->body->name->es, 'email'=> $store->body->email, 'password'=> $password]);
        return ApiResponse::response(200, 'OK', 'it works');
    }

}
