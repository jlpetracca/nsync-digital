<?php
namespace App\Services;
abstract class Service {

    /**
     * @return mixed
     */
    abstract public function getToken();

    /**
     * @param array $products
     * @param string $token
     * @return void
     */
    abstract public function uploadProducts(array $products, string $token): void;

    /**
     * @param string $token
     * @return mixed
     */
    abstract public function syncProducts(string $token): mixed;

    /**
     * @param array $options
     * @return mixed
     */
    protected function curl(array $options): mixed{
        $handle = curl_init();
        curl_setopt_array($handle, $options);
        $store = curl_exec($handle);
        $data  = json_decode($store,true);
        return $data;
    }

}