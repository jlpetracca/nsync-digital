<?php
	use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateMageCatalogCategoryEntityTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('mage_catalog_category_entity', function(Blueprint $table)
		{
			$table->integer('id')->primary();
			$table->string('name')->nullable();
			$table->integer('attribute_set_id')->nullable()->index('fk_mage_catalog_category_entity_mage_eav_entity_attribute_1');
			$table->date('updated_at')->nullable();
			$table->integer('parent_id')->nullable()->index('fk_mage_catalog_category_entity_mage_catalog_category_entity_1');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('mage_catalog_category_entity');
	}

}
