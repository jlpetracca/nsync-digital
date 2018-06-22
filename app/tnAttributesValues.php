<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class tnAttributesValues extends Model
{
	protected $table = 'tn_attributes_values';
	public $timestamps = false;
	
	/**
	 * The attributes that are mass assignable.
	 *
	 * @var array
	 */
	protected $fillable = [
		'tn_store_id', 'value','mage_value_id','attribute_id','product_id','variant_id',
	];
}
