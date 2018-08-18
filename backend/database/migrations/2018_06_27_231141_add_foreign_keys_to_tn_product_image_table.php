<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class AddForeignKeysToTnProductImageTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('tn_product_image', function(Blueprint $table)
		{
			$table->foreign('product_id', 'tn_product_image_tn_products_id_fk')->references('id')->on('tn_products')->onUpdate('RESTRICT')->onDelete('RESTRICT');
			$table->foreign('tn_store_id', 'tn_product_image_tn_store_id_fk')->references('id')->on('tn_store')->onUpdate('RESTRICT')->onDelete('RESTRICT');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('tn_product_image', function(Blueprint $table)
		{
			$table->dropForeign('tn_product_image_tn_products_id_fk');
			$table->dropForeign('tn_product_image_tn_store_id_fk');
		});
	}

}
