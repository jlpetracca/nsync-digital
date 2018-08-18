<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class AddForeignKeysToMageCatalogCategoryEntityTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('mage_catalog_category_entity', function(Blueprint $table)
		{
			$table->foreign('attribute_set_id', 'fk_entity_mage_eav_entity_attribute_set_id_fk')->references('attribute_set_id')->on('mage_eav_entity_attribute')->onUpdate('RESTRICT')->onDelete('RESTRICT');
			$table->foreign('parent_id', 'fk_mage_tegory_entity_1_resume')->references('id')->on('mage_catalog_category_entity')->onUpdate('RESTRICT')->onDelete('RESTRICT');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('mage_catalog_category_entity', function(Blueprint $table)
		{
			$table->dropForeign('fk_entity_mage_eav_entity_attribute_set_id_fk');
			$table->dropForeign('fk_mage_tegory_entity_1_resume');
		});
	}

}
