<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class tnAttributes extends Model
{
	protected $table = 'tn_attributes';
	public $timestamps = false;
	
	/**
	 * The attributes that are mass assignable.
	 *
	 * @var array
	 */
	protected $fillable = [
		'tn_store_id', 'name', 'mage_attribute_id'
	];
}
