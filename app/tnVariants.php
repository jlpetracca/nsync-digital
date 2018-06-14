<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class tnVariants extends Model
{
	protected $table = 'tnVariants';
	
	/**
	 * The attributes that are mass assignable.
	 *
	 * @var array
	 */
	protected $fillable = [
		'tn_store_id', 'product_id', 'image_id', 'position','price','promotional_price', 'stock_management',
		'stock','weight','width','height', 'depth', 'sku', 'barcode', 'status'
	];
}
