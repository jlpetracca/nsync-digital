<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateTnStoreTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('tn_store', function(Blueprint $table)
		{
			$table->integer('id')->primary()->comment('Tienda Nube Store Id');
			$table->integer('nsync_store_id')->nullable()->index('fk_tn_store_stores_1');
			$table->string('token')->nullable();
			$table->string('app_status')->nullable();
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('tn_store');
	}

}
