<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateNsyncStoresTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('nsync_stores', function(Blueprint $table)
		{
			$table->integer('id')->primary();
			$table->integer('marketplace_id')->nullable()->index('fk_stores_marketplaces_1');
			$table->string('status')->nullable();
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('nsync_stores');
	}

}
