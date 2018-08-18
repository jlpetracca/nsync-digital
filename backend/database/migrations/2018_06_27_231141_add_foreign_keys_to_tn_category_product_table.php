<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class AddForeignKeysToTnCategoryProductTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('tn_category_product', function(Blueprint $table)
		{
			$table->foreign('category_id', 'tn_category_product_tn_categories_id_fk')->references('id')->on('tn_categories')->onUpdate('RESTRICT')->onDelete('RESTRICT');
			$table->foreign('product_id', 'tn_category_product_tn_products_id_fk')->references('id')->on('tn_products')->onUpdate('RESTRICT')->onDelete('RESTRICT');
			$table->foreign('store_id', 'tn_category_product_tn_store_id_fk')->references('id')->on('tn_store')->onUpdate('RESTRICT')->onDelete('RESTRICT');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('tn_category_product', function(Blueprint $table)
		{
			$table->dropForeign('tn_category_product_tn_categories_id_fk');
			$table->dropForeign('tn_category_product_tn_products_id_fk');
			$table->dropForeign('tn_category_product_tn_store_id_fk');
		});
	}

}
