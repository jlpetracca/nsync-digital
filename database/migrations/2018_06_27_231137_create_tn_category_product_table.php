<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateTnCategoryProductTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('tn_category_product', function(Blueprint $table)
		{
			$table->integer('store_id')->index('store_id');
			$table->integer('category_id');
			$table->integer('product_id')->index('tn_category_product_tn_products_id_fk');
			$table->primary(['store_id','category_id','product_id']);
			$table->unique(['category_id','product_id'], 'category_product');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('tn_category_product');
	}

}
