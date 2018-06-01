<?php
namespace App\Services;

class TiendaNubeService {
	
	protected $token;
	
	/**
	 * @param array $credentials
	 * @return $this
	 * @throws \TiendaNube\Auth\Exception
	 */
	public function setAccessToken(array $credentials)
    {
        $auth = new \TiendaNube\Auth($credentials['clientId'], $credentials['clientSecret']);
        $accessToken = $auth->request_access_token($credentials['code']);
        $this->token = $accessToken;
        return $this;
    }
    
	/**
	 * @return \TiendaNube\TiendaNube
	 */
	public function getStore(){
		$api = new \TiendaNube\API($this->token['store_id'], $this->token['access_token'], 'Awesome App (contact@awesome.com)');
		return $api->get("store");
	}
	
	public function getWebHook(){
		$api = new \TiendaNube\API($this->token['store_id'], $this->token['access_token'], 'Awesome App (contact@awesome.com)');
		return $api->get("webhooks");
	}
	
    /**
     * @param array $products
     * @param string $token
     * @return mixed|void
     */
    public function uploadProducts(array $products, string $token): void
    {
        // TODO: Implement getUploadedProducts() method.
    }

    /**
     * @param string $token
     * @return mixed
     */
    public function syncProducts(string $token)
    {
        $url = 'https://api.tiendanube.com/v1/'.$this->credentials['clientId'] .
            '/products/?sort_by=best-selling&published=true&per_page=50';

        $options = [
            CURLOPT_URL => $url,
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST  => 'GET',
            CURLOPT_USERAGENT      => 'NWA Digital (interno@nwa.digital)',
            CURLOPT_HTTPHEADER     => ["authentication: bearer". $token],
        ];

        $products = $this->curl($options);
        $getProductsParsed = $this->getProductsParsed($products);
        $productsWithStock = $this->verifyStock($getProductsParsed);
        $syncProducts = new SyncService($productsWithStock);
        $syncProducts->sync();
    }
    
    /**
     * @param array $products
     * @return array
     */
    private function getProductsParsed(array $products): array
    {
        $productsParsed = [];
        foreach($products as $productsParser => $product)
        {
            $name = $product['name']['es'];
            $description  = !empty($product['description']['es']) ? $product['description']['es'] :
                $key['description']['es'] = "No tiene descripción asociada";
            $canonical_url  = $product['canonical_url'];

            foreach($product['images'] as $imageParser => $image){

                $product = Product::where('product_id', '=', $image['id'])->first();
                if($product === null){

                    $productsParsed[] = [
                        'store_id'      => 1,
                        'name'          => $name,
                        'description'   => $description,
                        'url'           => $canonical_url,
                        'variation_id'  => $image['id'],
                        'product_id'    => $image['product_id'],
                        'src'           => $image['src'],
                        'position'      => $image['position'],
                        'price'         => isset($product['variants'][$image]['price']) ? $product['variants'][$image]['price'] : null,
                        'stock'         => isset($product['variants'][$image]['stock']) ? $product['variants'][$image]['stock'] : null,
                        'promotional_price' => isset($product['variants'][$image]['promotional_price']) ? $product['variants'][$image]['promotional_price'] : 0,
                        'selected'      => 0,
                        'user_id'       => 1,
                        'link'          => $product['handle']['es']

                    ];
                }

            }

        }
        return $productsParsed;
    }

    /**
     * @param array $productsParsed
     * @return array
     */
    private function verifyStock(array $productsParsed): array
    {
        foreach($productsParsed as $productParsed => $product)
        {
            if($product['position'] == 1 && $product['stock'] != 0)
            {
                $productsParsed[$productParsed]['selected'] = 1;
            }
        }
        return $productsParsed;
    }
    
	/**
	 * @param array $options
	 * @return mixed
	 */
	protected function curl(array $options){
		$handle = curl_init();
		curl_setopt_array($handle, $options);
		$store = curl_exec($handle);
		$data  = json_decode($store,true);
		return $data;
	}
}