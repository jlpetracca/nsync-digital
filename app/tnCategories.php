<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class tnCategories extends Model
{
	protected $table = 'tnCategories';
	
	
	/**
	 * The attributes that are mass assignable.
	 *
	 * @var array
	 */
	protected $fillable = [
		'tn_store_id', 'handle', 'category_id','name', 'description',
		'parent', 'mage_catalog_category_product_entity_id', 'subcategories','seo_description','seo_title'
	];
}
