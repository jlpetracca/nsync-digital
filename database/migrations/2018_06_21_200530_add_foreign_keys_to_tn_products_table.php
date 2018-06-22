<?php
	use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class AddForeignKeysToTnProductsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('tn_products', function(Blueprint $table)
		{
			$table->foreign('tn_store_id', 'fk_tn_products')->references('id')->on('tn_store')->onUpdate('RESTRICT')->onDelete('RESTRICT');
			$table->foreign('category_id', 'fk_tn_products_tn_categories_1')->references('id')->on('tn_categories')->onUpdate('RESTRICT')->onDelete('RESTRICT');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('tn_products', function(Blueprint $table)
		{
			$table->dropForeign('fk_tn_products');
			$table->dropForeign('fk_tn_products_tn_categories_1');
		});
	}

}
