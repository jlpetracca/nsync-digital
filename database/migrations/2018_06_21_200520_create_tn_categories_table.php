<?php
	use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateTnCategoriesTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('tn_categories', function(Blueprint $table)
		{
			$table->integer('id')->primary();
			$table->integer('tn_store_id')->nullable()->index('fk_tn_store_categories_tn_store_1');
			$table->string('name')->nullable();
			$table->string('description')->nullable();
			$table->string('handle')->nullable();
			$table->string('parent')->nullable();
			$table->string('seo_title')->nullable();
			$table->string('seo_description')->nullable();
			$table->timestamps();
			$table->integer('mage_category_entity_id')->nullable()->index('fk_tn_categories_mage_catalog_category_entity_1');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('tn_categories');
	}

}
