<?php

namespace App\Services;

class BackgroundProcessTn
{
	/**
	 * @param string $token
	 * @param string $storeId
	 */
	public function backgroundProcess(string $storeId, string $token){
		$api = new \TiendaNube\API($storeId, $token, 'Nsync Digital (nsync@nsync.co)');
		$products = $api->get("products/?sort_by=best-selling&published=true&per_page=50");
		$tiendaNubeService = new TiendaNubeService();
		$tiendaNubeService->setStoreId($storeId)->processTnProducts($products);
	}
}