<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class AddForeignKeysToNsyncStoresTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('nsync_stores', function(Blueprint $table)
		{
			$table->foreign('marketplace_id', 'nsync_stores_nsync_marketplaces_id_fk')->references('id')->on('nsync_marketplaces')->onUpdate('RESTRICT')->onDelete('RESTRICT');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('nsync_stores', function(Blueprint $table)
		{
			$table->dropForeign('nsync_stores_nsync_marketplaces_id_fk');
		});
	}

}
