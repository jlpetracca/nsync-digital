<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class tnCategories extends Model
{
	protected $table = 'tn_categories';
	
	
	/**
	 * The attributes that are mass assignable.
	 *
	 * @var array
	 */
	protected $fillable = [
		'id','tn_store_id', 'handle', 'category_id','name', 'description',
		'parent', 'mage_catalog_category_product_entity_id','seo_description','seo_title'
	];
}
