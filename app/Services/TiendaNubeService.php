<?php
namespace App\Services;
use App\tnAttributes;
use App\tnAttributesValues;
use App\tnCategoriesProducts;
use App\tnProductImages;
use App\tnProducts;
use App\tnStore;
use App\tnVariants;

class TiendaNubeService {
	
	protected $token;
	
	const APP_STATUS = 1;
	
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
	
	public function saveTiendaNubeStore(){
		tnStore::create([
			'nsync_store_id'    => $this->token['store_id'],
			'token'             => $this->token['access_token'],
			'app_status'        => self::APP_STATUS
	    ]);
	}
	
	/**
	 * @return \TiendaNube\TiendaNube
	 */
	public function getWebHook(){
		$api = new \TiendaNube\API($this->token['store_id'], $this->token['access_token'], 'Awesome App (contact@awesome.com)');
		return $api->get("webhooks");
	}
	
	public function syncProducts(){
		$api = new \TiendaNube\API($this->token['store_id'], $this->token['access_token'], 'Awesome App (contact@awesome.com)');
		$products = $api->get("products/?sort_by=best-selling&published=true&per_page=50");
		$this->doSaveTiendaNubeProducts($products);
	}
	
	/**
	 * @param \TiendaNube\API\Response $products
	 */
	private function doSaveTiendaNubeProducts(\TiendaNube\API\Response $products){
		foreach($products as $productsIndex => $productsValue) {
			foreach ($productsValue as $productDetailIndex => $productDetail) {
				$this->saveProductsFields($productDetail);
				$this->saveVariantsFields($productDetail->variants[$productDetailIndex]);
				$this->saveImagesFields($productDetail->images[$productDetailIndex]);
				//$this->saveAttributesFields($productDetail->attributes[$productDetailIndex]);
				//$this->saveAttributesValuesFields($productDetail->variants[$productDetailIndex]->values[$productDetailIndex]);
				//$this->saveCategoriesProductsFields($productDetail->categories[$productDetailIndex]);
			}
		}
	}
	
	/**
	 * @param $categoriesProduct
	 */
	private function saveCategoriesProductsFields($categoriesProduct){
		tnCategoriesProducts::create([
			'tn_store_id'   => $this->token['store_id'],
			'product_id'    => $categoriesProduct->product_id,
			'category_id'   => $categoriesProduct->category_id,
			'mage_catalog_category_product_entity_id'  =>  null
		]);
	}
	
	/**
	 * @param $variants
	 */
	private function saveVariantsFields($variants){
		tnVariants::create([
			'tn_store_id'       => $this->token['store_id'],
			'product_id'        => $variants->product_id,
			'image_id'          => $variants->image_id,
			'position'          => $variants->position,
			'price'             => $variants->price,
			'promotional_price' => $variants->promotional_price,
			'stock_management'  => $variants->stock_management,
			'stock'             => $variants->stock,
			'weight'            => $variants->weight,
			'width'             => $variants->width,
			'height'            => $variants->height,
			'depth'             => $variants->depth,
			'sku'               => $variants->sku,
			'barcode'           => $variants->barcode,
			'status'            => true
		]);
	}
	
	/**
	 * @param $images
	 */
	private function saveImagesFields($images){
		tnProductImages::create([
			'tn_store_id'  => $this->token['store_id'],
			'product_id'   => $images->product_id,
			'src'          => $images->src,
			'position'     => $images->position,
			'alt'          => null
		]);
	}
	
	/**
	 * @param $attributesValues
	 */
	private function saveAttributesValuesFields($attributesValues = null){
		tnAttributesValues::create([
			'tn_store_id'  => $this->token['store_id'],
			'value'        => $attributesValues->en,
		]);
	}
	
	/**
	 * @param $attributes
	 */
	private function saveAttributesFields($attributes){
		tnAttributes::create([
			'tn_store_id'  => $this->token['store_id'],
			'name'  =>  $attributes->en
		]);
	}
	
	/**
	 * @param $productDetail
	 */
	private function saveProductsFields($productDetail){
		tnProducts::create([
			'tn_store_id'       => $this->token['store_id'],
			'mage_status_id'    => null,
			'category_id'       => null,
			'name'              => $productDetail->name->es,
			'description'       => !empty($productDetail->description->es) ? $productDetail->description->es :
				$productDetail->description->es = "No tiene descripción asociada",
			'handle'            => $productDetail->handle->es,
			'published'         => $productDetail->published,
			'free_shipping'     => $productDetail->free_shipping,
			'seo_title'         => $productDetail->seo_title->es,
			'seo_description'   =>  $productDetail->seo_description->es,
			'brand'             => $productDetail->brand,
			'tags'              => $productDetail->tags,
			'status'            => null,
		]);
	}
	
}