<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class tnStore extends Model
{
    protected $table = 'tnStore';
	
	/**
	 * The attributes that are mass assignable.
	 *
	 * @var array
	 */
	protected $fillable = [
		'nsync_store_id', 'token', 'app_status'
	];
}
