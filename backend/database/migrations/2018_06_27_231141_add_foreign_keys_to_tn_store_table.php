<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class AddForeignKeysToTnStoreTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('tn_store', function(Blueprint $table)
		{
			$table->foreign('nsync_store_id', 'tn_store_nsync_stores_id_fk')->references('id')->on('nsync_stores')->onUpdate('RESTRICT')->onDelete('RESTRICT');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('tn_store', function(Blueprint $table)
		{
			$table->dropForeign('tn_store_nsync_stores_id_fk');
		});
	}

}
