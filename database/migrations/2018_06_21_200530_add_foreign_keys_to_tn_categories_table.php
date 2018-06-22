<?php
	use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class AddForeignKeysToTnCategoriesTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('tn_categories', function(Blueprint $table)
		{
			$table->foreign('mage_category_entity_id', 'fk_tn_categories_mage_catalog_category_entity_1')->references('id')->on('mage_catalog_category_entity')->onUpdate('RESTRICT')->onDelete('RESTRICT');
			$table->foreign('tn_store_id', 'fk_tn_store_categories_tn_store_1')->references('id')->on('tn_store')->onUpdate('RESTRICT')->onDelete('RESTRICT');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('tn_categories', function(Blueprint $table)
		{
			$table->dropForeign('fk_tn_categories_mage_catalog_category_entity_1');
			$table->dropForeign('fk_tn_store_categories_tn_store_1');
		});
	}

}
