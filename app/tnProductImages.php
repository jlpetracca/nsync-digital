<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class tnProductImages extends Model
{
	protected $table = 'tn_product_image';
	
	/**
	 * The attributes that are mass assignable.
	 *
	 * @var array
	 */
	protected $fillable = [
		'id','tn_store_id', 'product_id', 'src', 'alt', 'position'
	];
}
