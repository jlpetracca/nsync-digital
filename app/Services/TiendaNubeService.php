<?php
namespace App\Services;
use App\tnAttributes;
use App\tnAttributesValues;
use App\tnCategories;
use App\tnProductImages;
use App\tnProducts;
use App\tnStore;
use App\tnVariants;

class TiendaNubeService {
	
	protected $token;
	
	const APP_STATUS = 1;
	const URL_TIENDA_NUBE = 'https://www.tiendanube.com/apps/668/authorize';
	const CLIENT_ID_TIENDA_NUBE = '668';
	const CLIENT_SECRET_TIENDA_NUBE = '0d1RCsc673OHbquxcts3JJv26NdkIUV0sQ4I8ZuUpI1RU2gz';
	const MARKETPLACE_ID = 1;

	/**
	 * @param array $credentials
	 * @return $this
	 * @throws \TiendaNube\Auth\Exception
	 */
	public function setAccessToken(array $credentials){
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
	/*
	 * Save Principal storeInfo
	 */
	public function saveTiendaNubeStore(){
		tnStore::create([
			'id'                => $this->token['store_id'],
			'nsync_store_id'    => null,
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
	
	/*
	 * Sync Products from TN
	 */
	public function syncProducts(){
		$api = new \TiendaNube\API($this->token['store_id'], $this->token['access_token'], 'Awesome App (contact@awesome.com)');
		$products = $api->get("products/?sort_by=best-selling&published=true&per_page=50");
		$this->saveTnProducts($products);
	}
	
	/**
	 * @param $products
	 */
	private function saveTnProducts($products){
		foreach($products->body as $productIndex => $product){
			//Process and save the attributes array
			$this->saveTnAttributesOnDBAndGetId($product->attributes);
			//Process Variants and retrieve values
			$aValues = $this->saveTnVariantsOnDBAndGetAvalues($product->variants);
			//Process aValues and assign aId
			$this->saveAvaluesAndAssignAIdOnDB($aValues);
			//Process tnVariants and attributes
			$this->saveTnVariantsAndAttributes();
			
		}
	}
	
	private function saveTnVariantsAndAttributes(){
	
	}
	
	/**
	 * @param array $aValues
	 * @return mixed
	 */
	private function saveAvaluesAndAssignAIdOnDB($aValues = []){
		$attributeIds = tnAttributes::where('id' ,'>' ,0)->pluck('id')->toArray();
		foreach($aValues as $valuesObject) {
			if(!empty($valuesObject)){
				foreach($valuesObject as $aId => $value){
					tnAttributesValues::create([
						'tn_store_id'   => $this->token['store_id'],
						'value'         => $value->es,
						'attribute_id'  => $attributeIds[$aId],
						'mage_value_id' => null
					]);
				}
			}
		}
	}
	
	/**
	 * @param $attributes
	 * @return mixed
	 */
	private function saveTnAttributesOnDBAndGetId($attributes){
		if(!empty($attributes)){
			foreach($attributes as $attributeIndex => $attribute){
				if(!tnAttributes::where('name', $attribute->es)->first()){
					tnAttributes::create([
						'tn_store_id'       => $this->token['store_id'],
						'name'              => $attribute->es,
						'mage_attribute_id' => null
					]);
				}
			}
		}
	}
	
	/**
	 * @param $variants
	 * @return mixed
	 */
	private function saveTnVariantsOnDBAndGetAvalues($variants){
		$attributeValues = [];
		if(!empty($variants)){
			foreach ($variants as $variantIndex => $variant){
				if(!tnVariants::where('id', $variant->id)->first()){
					tnVariants::create([
						'id'                => $variant->id,
						'tn_store_id'       => $this->token['store_id'],
						'product_id'        => null,
						'image_id'          => null,
						'position'          => $variant->position,
						'price'             => $variant->price,
						'promotional_price' => $variant->promotional_price,
						'stock_management'  => $variant->stock_management,
						'stock'             => $variant->stock,
						'weight'            => $variant->weight,
						'width'             => $variant->width,
						'height'            => $variant->height,
						'depth'             => $variant->depth,
						'sku'               => $variant->sku,
						'barcode'           => $variant->barcode,
						'status'            => true
					]);
					$attributeValues[] = $variant->values;
				}
			}
			return $attributeValues;
		}
	}
}