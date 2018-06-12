<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class tnCategoriesProducts extends Model
{
	protected $table = 'tnCategoriesProducts';
	
	/**
	 * The attributes that are mass assignable.
	 *
	 * @var array
	 */
	protected $fillable = [
		'tn_store_id', 'product_id', 'category_id', 'mage_catalog_category_product_entity_id'
	];
}
