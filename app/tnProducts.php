<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class tnProducts extends Model
{
    protected $table = 'tnProducts';
	
	/**
	 * The attributes that are mass assignable.
	 *
	 * @var array
	 */
	protected $fillable = [
		'tn_store_id', 'mage_status_id', 'category_id', 'name', 'description', 'handle','published',
		'handle', 'free_shipping', 'seo_title', 'seo_description', 'brand', 'tags', 'status'
	];
}
