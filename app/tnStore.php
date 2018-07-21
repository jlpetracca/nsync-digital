<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class tnStore extends Model
{
    protected $table = 'tn_store';
	public $timestamps = false;
	
	/**
	 * The attributes that are mass assignable.
	 *
	 * @var array
	 */
	protected $fillable = [
		'id', 'nsync_store_id', 'token', 'app_status'
	];
}
