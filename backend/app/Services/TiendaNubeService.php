<?php
namespace App\Services;
use App\tnAttributes;
use App\tnAttributesValues;
use App\tnCategories;
use App\tnCategoryProducts;
use App\tnProductImages;
use App\tnProducts;
use App\tnStore;
use App\tnVariants;
use App\tnVariantsAttributes;
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
	 * @param string $storeId
	 * @return $this
	 */
	public function setStoreId(string $storeId){
		$this->token['store_id'] = $storeId;
		return $this;
	}
	
	/**
	 * @return \TiendaNube\TiendaNube
	 */
	public function getStore(){
		$api = new \TiendaNube\API($this->token['store_id'], $this->token['access_token'],
			'Nsync Digital (nsync@nsync.co)');
		return $api->get("store");
	}
	
	/*
	 * Save Principal storeInfo
	 */
	public function saveTiendaNubeStore(){
		$tnStoreInfo = [
			'id'                => $this->token['store_id'],
			'nsync_store_id'    => null,
			'token'             => $this->token['access_token'],
			'app_status'        => self::APP_STATUS
		];
		self::saveOrUpdateTn(new tnStore(), $tnStoreInfo,'id', $this->token['store_id']);
	}
	
	/**
	 * @return \TiendaNube\TiendaNube
	 */
	public function getWebHook(){
		$api = new \TiendaNube\API($this->token['store_id'], $this->token['access_token'],
			'Nsync Digital (nsync@nsync.co)');
		return $api->get("webhooks");
	}
	
	/*
	 * Sync Products from TN
	 */
	public function getTnProducts(){
		$api = new \TiendaNube\API($this->token['store_id'], $this->token['access_token'],
			'Nsync Digital (nsync@nsync.co)');
		$products = $api->get("products/?sort_by=best-selling&published=true&per_page=50");
		$this->processTnProducts($products);
	}
	
	/**
	 * @param $products
	 */
	public function processTnProducts($products){
		foreach($products->body as $productIndex => $product){
			//Save tnProduct
			$this->saveTnProductFieldOnDB($product);
			//Save and save the attributes array
			$this->saveTnAttributesOnDB($product->attributes);
			//Save Variants and retrieve values
			$aValuesWithVIds = $this->saveTnVariantsOnDBAndGetAvaluesWithVIds($product->id, $product->variants);
			//Structure Variants Attributes
			$this->getVariantsAttributesStructure($product->id, $aValuesWithVIds);
			//Save tnImages
			$this->saveTnImagesOnDB($product->images);
			//Save tnCategories
			$this->saveTnCategoriesOnDB($product->id, $product->categories);
		}
	}
	
	/**
	 * @param $productId
	 * @param array $variantsWithAValues
	 */
	private function getVariantsAttributesStructure($productId, $variantsWithAValues = []){
		foreach ($variantsWithAValues as $properties){
			foreach ($properties['aValues'] as $attributeId => $aValue){
				$variantsAttributeInfo = [
					'tn_store_id'           => $this->token['store_id'],
					'product_id'            => $productId,
					'variant_id'            => $properties['variantId'],
					'attribute_value_id'    => $this->getAvalueId($aValue->es, $attributeId)['id'],
					'attribute_id'          => $this->getModelIds(new tnAttributes())[$attributeId]
				];
				
				if(!tnVariantsAttributes::where('tn_store_id',$this->token['store_id'])
					->where('variant_id', $properties['variantId'])
					->where('product_id', $productId)
					->where('attribute_value_id', $this->getAvalueId($aValue->es, $attributeId)['id'])
					->where('attribute_id', $this->getModelIds(new tnAttributes())[$attributeId])
					->first()){
					tnVariantsAttributes::create($variantsAttributeInfo);
				}
				else{
					tnVariantsAttributes::where('variant_id', $properties['variantId'])
						->where('product_id', $productId)
						->where('attribute_value_id', $this->getAvalueId($aValue->es, $attributeId)['id'])
						->where('attribute_id', $this->getModelIds(new tnAttributes())[$attributeId])
						->update($variantsAttributeInfo);
				}
			}
		}
	}
	
	/**
	 * @param $value
	 * @param $indexValue
	 * @return null
	 */
	private function getAvalueId($value, $indexValue){
		$aValueId = tnAttributesValues::where('value', $value)->first();
		if (!$aValueId) {
			$aValueId = tnAttributesValues::create([
				'tn_store_id'   => $this->token['store_id'],
				'value'         => $value,
				'attribute_id'  => $this->getModelIds(new tnAttributes())[$indexValue],
				'mage_value_id' => null
			]);
		}
		else{
			$aValueId = tnAttributesValues::where('value', $value)->where('tn_store_id', $this->token['store_id'])->first();
		}
		return $aValueId;
	}
	
	/**
	 * @param $attributes
	 */
	private function saveTnAttributesOnDB($attributes = []){
		if(!empty($attributes)){
			foreach($attributes as $attributeIndex => $attribute){
				if(!tnAttributes::where('name', $attribute->es)->where('tn_store_id', $this->token['store_id'])->first()){
					tnAttributes::create([
						'tn_store_id'       => $this->token['store_id'],
						'name'              => $attribute->es,
						'mage_attribute_id' => null
					]);
				}
				else{
					tnAttributes::where('name', $attribute->es)
						->where('tn_store_id', $this->token['store_id'])
						->update([
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
	private function saveTnVariantsOnDBAndGetAvaluesWithVIds($productId, $variants = []){
		$variantsWithAvalues = [];
		if(!empty($variants)){
			foreach ($variants as $variantIndex => $variant){
				$variantInfo = [
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
				];
				
				if(!tnVariants::where('id', $variant->id)->first()){
					tnVariants::create($variantInfo);
					$variantsWithAvalues[] = ['variantId' => $variant->id, 'aValues' => $variant->values];
				}
				else{
					tnVariants::find($variant->id)->update($variantInfo);
					$variantsWithAvalues[] = ['variantId' => $variant->id, 'aValues' => $variant->values];
				}
			}
		}
		return $variantsWithAvalues;
	}
	
	/**
	 * @param array $images
	 */
	private function saveTnImagesOnDB($images = []){
		if(!empty($images)){
			foreach($images as $imageIndex => $image){
				$imageInfo = [
					'id'            => $image->id,
					'tn_store_id'   => $this->token['store_id'],
					'product_id'    => $image->product_id,
					'src'           => $image->src,
					'position'      => $image->position,
					'alt'           => null
				];
				if(!tnProductImages::where('id', $image->id)->first()){
					tnProductImages::create($imageInfo);
				}else{
					tnProductImages::find($image->id)->update($imageInfo);
				}
			}
		}
	}
	
	/**
	 * @param $productId
	 * @param array $categories
	 */
	private function saveTnCategoriesOnDB($productId, $categories = []){
		if(!empty($categories)){
			foreach($categories as $categoryIndex => $category){
				$categoryInfo = [
					'id'                => $category->id,
					'tn_store_id'       => $this->token['store_id'],
					'handle'            => $category->handle->es,
					'name'              => $category->name->es,
					'description'       => $category->description->es,
					'parent'            => $category->parent,
					'seo_title'         => $category->seo_title->es,
					'seo_description'   => $category->seo_description->es,
					'mage_category_entity_id' => null
				];
				$categoryProductInfo = [
					'category_id'  => $category->id,
					'store_id'     => $this->token['store_id'],
					'product_id'   => $productId
				];
				if(!tnCategories::where('id', $category->id)->first() && !tnCategoryProducts::where('category_id', $category->id)->first()){
					tnCategories::create($categoryInfo);
					tnCategoryProducts::create($categoryProductInfo);
				}
				else{
					tnCategories::find($category->id)->update($categoryInfo);
					tnCategoryProducts::where('category_id', $category->id)->update($categoryProductInfo);
				}
			}
		}
	}
	
	/**
	 * @param $productDetail
	 */
	private function saveTnProductFieldOnDB($productDetail){
		$productInfo = [
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
			'status'            => null
		];
		self::saveOrUpdateTn(new tnProducts(), $productInfo,'id', $productDetail->id);
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
	
	/**
	 * @param Model $model
	 * @param array $records
	 * @param string $defaultIdentifier
	 * @param $identifier
	 */
	private static function saveOrUpdateTn(Model $model, array $records, string $defaultIdentifier, $identifier){
		$search = $model::where($defaultIdentifier, $identifier)->first();
		if(!empty($search)) {
			$model::where($defaultIdentifier, $identifier)->update($records);
		}
		else{
			$model::create($records);
		}
	}
	
}