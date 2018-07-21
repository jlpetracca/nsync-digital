<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class tnCategoryProducts extends Model
{
	protected $table = 'tn_category_product';
	public $timestamps = false;
	
	/**
	 * The attributes that are mass assignable.
	 *
	 * @var array
	 */
	protected $fillable = [
		'id','store_id', 'category_id', 'product_id'
	];
}
