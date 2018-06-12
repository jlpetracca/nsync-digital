<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class tnProductImages extends Model
{
	protected $table = 'tnProductImages';
	
	/**
	 * The attributes that are mass assignable.
	 *
	 * @var array
	 */
	protected $fillable = [
		'tn_store_id', 'product_id', 'src', 'alt', 'position', 'image_id'
	];
}
