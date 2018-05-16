<?php
namespace App\Services;
class ServiceFactory {

    /**
     * @param string $service
     * @param array $credentials
     * @return Service
     */
    public static function getService(string $service, array $credentials = []): Service
    {
        $object = null;
        switch ($service){
            case 'magento':
                $object = new MagentoService($credentials);
                break;
            case 'tiendaNube':
                $object = new TiendaNubeService($credentials);
                break;
        }
        return $object;
    }
}