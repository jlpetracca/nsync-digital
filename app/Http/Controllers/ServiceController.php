<?php

namespace App\Api\V1\Controllers;
use App\Helpers\ApiResponse;
use App\Http\Controllers\Controller;
use App\Services\ServiceFactory;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

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
     * @param Request $request
     * @return JsonResponse
     */
    public function tiendaNube(Request $request): JsonResponse
    {
        $credentials = [
            'clientId'     => config('tiendaNube.client_id'),
            'clientSecret' => config('tiendaNube.client_secret'),
            'code'         => $request['code']
        ];
        $tiendaNubeService = ServiceFactory::getService('tiendaNube', $credentials);
        $accessToken = $tiendaNubeService->getToken();
        //$tiendaNubeService->syncProducts($accessToken);
        return ApiResponse::response(200, 'OK', $accessToken);
    }

}
