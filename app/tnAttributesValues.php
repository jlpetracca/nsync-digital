<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class tnAttributesValues extends Model
{
	protected $table = 'tnAttributesValues';
	
	/**
	 * The attributes that are mass assignable.
	 *
	 * @var array
	 */
	protected $fillable = [
		'tn_store_id', 'value','mage_value_id'
	];
}
