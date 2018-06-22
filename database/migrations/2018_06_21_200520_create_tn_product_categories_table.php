<?php
	use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateTnProductCategoriesTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('tn_product_categories', function(Blueprint $table)
		{
			$table->integer('id')->primary();
			$table->integer('tn_store_id')->nullable();
			$table->integer('product_id')->nullable()->index('fk_tn_product_categories_tn_product_image_1');
			$table->integer('category_id')->nullable()->index('fk_tn_product_categories_tn_categories_1');
			$table->string('mage_catalog_category_product_entity_id')->nullable()->comment('Da rapidez a la hora de encontrar la relacion producto categoria en la tabla catalog_category_product. Esa tabla se puede traer como tabla federada');
			$table->index(['tn_store_id','product_id','category_id'], 'tn_store_id');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('tn_product_categories');
	}

}
