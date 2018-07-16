<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class tnVariantsAttributes extends Model
{
	protected $table = 'tn_variants_attributes';
	
	/**
	 * The attributes that are mass assignable.
	 *
	 * @var array
	 */
	protected $fillable = [
		'tn_store_id', 'product_id', 'variant_id', 'attribute_id', 'attribute_value_id'
	];
}
