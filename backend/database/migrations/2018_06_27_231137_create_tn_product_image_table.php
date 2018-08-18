<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateTnProductImageTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('tn_product_image', function(Blueprint $table)
		{
			$table->integer('id')->primary();
			$table->integer('tn_store_id')->nullable();
			$table->integer('product_id')->nullable()->index('fk_tn_product_image_tn_products_1');
			$table->string('src')->nullable();
			$table->string('position')->nullable();
			$table->string('alt')->nullable();
			$table->timestamps();
			$table->index(['tn_store_id','product_id'], 'tn_store_id');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('tn_product_image');
	}

}
