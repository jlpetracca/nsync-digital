<?php
	use Illuminate\Support\Facades\Schema;
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
			$table->foreign('image_id', 'fk_tn_variants_tn_product_image_1')->references('id')->on('tn_product_image')->onUpdate('RESTRICT')->onDelete('RESTRICT');
			$table->foreign('product_id', 'fk_tn_variants_tn_products_1')->references('id')->on('tn_products')->onUpdate('RESTRICT')->onDelete('RESTRICT');
			$table->foreign('tn_store_id', 'fk_tn_variants_tn_store_1')->references('id')->on('tn_store')->onUpdate('RESTRICT')->onDelete('RESTRICT');
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
			$table->dropForeign('fk_tn_variants_tn_product_image_1');
			$table->dropForeign('fk_tn_variants_tn_products_1');
			$table->dropForeign('fk_tn_variants_tn_store_1');
		});
	}

}
