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
		$this->saveTnProducts($products);
	}
	
	/**
	 * @param $products
	 */
	private function saveTnProducts($products){
		foreach($products->body as $productIndex => $product) {
			if(!tnProducts::where('product_id', $product->id)->first()){
				$this->saveProductFields($product);
				$this->saveAttributesFields($product->attributes);
				$this->saveVariantsFields($product->variants);
				$this->saveImagesFields($product->images);
				$this->saveCategories($product->categories);
			}
		}
	}
	
	/**
	 * @param  $categoriesProducts
	 */
	private function saveCategories($categoriesProducts){
		if(!empty($categoriesProducts)){
			foreach($categoriesProducts as $categoryProductsIndex => $categoryProducts){
				tnCategories::create([
					'tn_store_id'       => $this->token['store_id'],
					'category_id'       => $categoryProducts->id,
					'handle'            => $categoryProducts->handle->es,
					'name'              => $categoryProducts->name->es,
					'description'       => $categoryProducts->description->es,
					'parent'            => $categoryProducts->parent,
					'seo_title'         => $categoryProducts->seo_title->es,
					'seo_description'   => $categoryProducts->seo_description->es,
					'subcategories'     => !empty($categoryProducts->subcategories) ?
						$categoryProducts->subcategories[$categoryProductsIndex] : null,
					'mage_catalog_category_product_entity_id'  => null
				]);
			}
		}
	}
	
	/**
	 * @param $variantsValue
	 */
	private function saveAttributesValuesFields($variantsValue){
		foreach ($variantsValue as $valueIndex => $value){
			tnAttributesValues::create([
				'tn_store_id'   => $this->token['store_id'],
				'value'         => $value->es,
				'mage_value_id' => null,
			]);
		}
	}
	
	/**
	 * @param $images
	 */
	private function saveImagesFields($images){
		if(!empty($images)){
			foreach($images as $imageIndex => $image){
				tnProductImages::create([
					'tn_store_id'  => $this->token['store_id'],
					'product_id'   => $image->product_id,
					'src'          => $image->src,
					'position'     => $image->position,
					'alt'          => null
				]);
			}
		}
	}
	
	/**
	 * @param $variants
	 */
	private function saveVariantsFields($variants){
		if(!empty($variants)){
			foreach($variants as $variantIndex => $variant){
				if(!empty($variant->values)){
					$this->saveAttributesValuesFields($variant->values);
				}
				tnVariants::create([
					'tn_store_id'       => $this->token['store_id'],
					'product_id'        => $variant->product_id,
					'image_id'          => $variant->image_id,
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
			}
		}
	}
	
	/**
	 * @param $attributes
	 */
	private function saveAttributesFields($attributes){
		if(!empty($attributes)){
			foreach($attributes as $attributeIndex => $attribute){
				tnAttributes::create([
					'tn_store_id'       => $this->token['store_id'],
					'name'              => $attribute->es,
					'mage_attribute_id' => null
				]);
			}
		}
	}
	
	/**
	 * @param $productDetail
	 */
	private function saveProductFields($productDetail){
		tnProducts::create([
			'product_id'        => $productDetail->id,
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
			'seo_description'   => $productDetail->seo_description->es,
			'brand'             => $productDetail->brand,
			'tags'              => $productDetail->tags,
			'status'            => null,
		]);
	}
}