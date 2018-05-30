<?php
namespace App\Services;
use App\Product;

class TiendaNubeService extends Service
{
    protected $credentials;
    
    protected $clientId;

    /**
     * TiendaNubeService constructor.
     * @param array $credentials
     */
    public function __construct(array $credentials)
    {
        $this->credentials = $credentials;
    }

    /**
     * @return mixed
     * @throws \TiendaNube\Auth\Exception
     */
    public function getToken(): string
    {
        $auth = new \TiendaNube\Auth($this->credentials['clientId'], $this->credentials['clientSecret']);
        $accessToken = $auth->request_access_token($this->credentials['code']);
        $this->setClientId($accessToken['store_id']);
        return $accessToken['access_token'];
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
	 * @param string $token
	 * @return mixed
	 */
	public function getStore(string $token){
		$api = new \TiendaNube\API($this->getClientId(), $token, 'Awesome App (contact@awesome.com)');
		$response = $api->get("store");
		return $response;
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
	 * @return mixed
	 */
	public function getClientId()
	{
		return $this->clientId;
	}
	
	/**
	 * @param mixed $clientId
	 */
	public function setClientId($clientId): void
	{
		$this->clientId = $clientId;
	}
	
}