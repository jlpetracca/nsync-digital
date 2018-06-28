<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class AddForeignKeysToTnVariantsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('tn_variants', function(Blueprint $table)
		{
			$table->foreign('image_id', 'tn_variants_tn_product_image_id_fk')->references('id')->on('tn_product_image')->onUpdate('RESTRICT')->onDelete('RESTRICT');
			$table->foreign('product_id', 'tn_variants_tn_products_id_fk')->references('id')->on('tn_products')->onUpdate('RESTRICT')->onDelete('RESTRICT');
			$table->foreign('tn_store_id', 'tn_variants_tn_store_id_fk')->references('id')->on('tn_store')->onUpdate('RESTRICT')->onDelete('RESTRICT');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('tn_variants', function(Blueprint $table)
		{
			$table->dropForeign('tn_variants_tn_product_image_id_fk');
			$table->dropForeign('tn_variants_tn_products_id_fk');
			$table->dropForeign('tn_variants_tn_store_id_fk');
		});
	}

}
