<?php

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
			$table->foreign('mage_category_entity_id', 'tn_categories_mage_catalog_category_entity_id_fk')->references('id')->on('mage_catalog_category_entity')->onUpdate('RESTRICT')->onDelete('RESTRICT');
			$table->foreign('parent', 'tn_categories_tn_categories_id_fk')->references('id')->on('tn_categories')->onUpdate('RESTRICT')->onDelete('RESTRICT');
			$table->foreign('tn_store_id', 'tn_categories_tn_store_id_fk')->references('id')->on('tn_store')->onUpdate('RESTRICT')->onDelete('RESTRICT');
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
			$table->dropForeign('tn_categories_mage_catalog_category_entity_id_fk');
			$table->dropForeign('tn_categories_tn_categories_id_fk');
			$table->dropForeign('tn_categories_tn_store_id_fk');
		});
	}

}
