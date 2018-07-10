<?php
namespace App\Services;
use App\tnAttributes;
use App\tnAttributesValues;
use App\tnCategories;
use App\tnProductImages;
use App\tnProducts;
use App\tnStore;
use App\tnVariants;
use Illuminate\Database\Eloquent\Model;

class TiendaNubeService {
	
	protected $token;
	
	const APP_STATUS                = 1;
	const URL_TIENDA_NUBE           = 'https://www.tiendanube.com/apps/668/authorize';
	const CLIENT_ID_TIENDA_NUBE     = '668';
	const CLIENT_SECRET_TIENDA_NUBE = '0d1RCsc673OHbquxcts3JJv26NdkIUV0sQ4I8ZuUpI1RU2gz';
	const MARKETPLACE_ID            = 1;

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
		if(!tnStore::where('id', $this->token['store_id'])->first()){
			tnStore::create([
				'id'                => $this->token['store_id'],
				'nsync_store_id'    => null,
				'token'             => $this->token['access_token'],
				'app_status'        => self::APP_STATUS
			]);
		}
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
	public function getTnProducts(){
		$api = new \TiendaNube\API($this->token['store_id'], $this->token['access_token'], 'Awesome App (contact@awesome.com)');
		$products = $api->get("products/?sort_by=best-selling&published=true&per_page=50");
		$this->processTnProducts($products);
	}
	
	/**
	 * @param $products
	 */
	private function processTnProducts($products){
		foreach($products->body as $productIndex => $product){
			//Process tnProduct
			$this->saveTnProductFieldOnDB($product);
			//Process and save the attributes array
			$this->saveTnAttributesOnDBAndGetId($product->attributes);
			//Process Variants and retrieve values
			$aValues = $this->saveTnVariantsOnDBAndGetAvalues($product->id, $product->variants);
			//Process aValues and assign aId
			$this->saveAvaluesAndAssignAIdOnDB($aValues);
			//Process tnImages
			$this->saveTnImagesOnDB($product->images);
			//Process tnCategories
			$this->saveTnCategoriesOnDB($product->categories);
		}
	}
	
	/**
	 * @param array $aValues
	 * @return mixed
	 */
	private function saveAvaluesAndAssignAIdOnDB($aValues = []){
		foreach($aValues as $valuesObject) {
			if(!empty($valuesObject)){
				foreach($valuesObject as $aId => $value){
					if(!tnAttributesValues::where('value',  $value->es)->first()){
						tnAttributesValues::create([
							'tn_store_id'   => $this->token['store_id'],
							'value'         => $value->es,
							'attribute_id'  => $this->getModelIds(new tnAttributes())[$aId],
							'mage_value_id' => null
						]);
					}
				}
			}
		}
	}
	
	/**
	 * @param $attributes
	 * @return mixed
	 */
	private function saveTnAttributesOnDBAndGetId($attributes = []){
		if(!empty($attributes)){
			foreach($attributes as $attributeIndex => $attribute){
				if(!tnAttributes::where('name', $attribute->es)->where('tn_store_id', $this->token['store_id'])->first()){
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
	 * @param $productId
	 * @param array $variants
	 * @return mixed
	 */
	private function saveTnVariantsOnDBAndGetAvalues($productId, $variants = []){
		$attributeValues = [];
		if(!empty($variants)){
			foreach ($variants as $variantIndex => $variant){
				if(!tnVariants::where('id', $variant->id)->first()){
					tnVariants::create([
						'id'                => $variant->id,
						'tn_store_id'       => $this->token['store_id'],
						'product_id'        => $productId,
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
	
	/**
	 * @param array $images
	 */
	private function saveTnImagesOnDB($images = []){
		if(!empty($images)){
			foreach($images as $imageIndex => $image){
				if(!tnProductImages::where('id', $image->id)->first()){
					tnProductImages::create([
						'id'            => $image->id,
						'tn_store_id'   => $this->token['store_id'],
						'product_id'    => $image->product_id,
						'src'           => $image->src,
						'position'      => $image->position,
						'alt'           => null
					]);
				}
			}
		}
	}
	
	/**
	 * @param array $categories
	 */
	private function saveTnCategoriesOnDB($categories = []){
		if(!empty($categories)){
			foreach($categories as $categoryIndex => $category){
				if(!tnCategories::where('id', $category->id)->first()){
					tnCategories::create([
						'id'                => $category->id,
						'tn_store_id'       => $this->token['store_id'],
						'handle'            => $category->handle->es,
						'name'              => $category->name->es,
						'description'       => $category->description->es,
						'parent'            => $category->parent,
						'seo_title'         => $category->seo_title->es,
						'seo_description'   => $category->seo_description->es,
						'mage_category_entity_id' => null
					]);
				}
			}
		}
	}
	
	
	/**
	 * @param $productDetail
	 * @return mixed
	 */
	private function saveTnProductFieldOnDB($productDetail){
		if(!tnProducts::where('id', $productDetail->id)->first()){
			tnProducts::create([
				'id'                => $productDetail->id,
				'tn_store_id'       => $this->token['store_id'],
				'mage_entity_id'    => null,
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
	
	/**
	 * @param Model $model
	 * @return mixed
	 */
	private function getModelIds(Model $model){
		$modelIds = $model::where('id' ,'>' ,0)
			->where('tn_store_id', $this->token['store_id'])
			->pluck('id')
			->toArray();
		return $modelIds;
	}
	
}