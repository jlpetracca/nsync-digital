<?php
	use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateTnProductsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('tn_products', function(Blueprint $table)
		{
			$table->integer('id')->primary();
			$table->integer('tn_store_id')->nullable()->index('tn_store_id');
			$table->integer('category_id')->nullable()->index('fk_tn_products_tn_categories_1');
			$table->integer('mage_entity_id')->nullable();
			$table->string('name')->nullable();
			$table->string('description')->nullable();
			$table->string('handle')->nullable();
			$table->string('published')->nullable();
			$table->string('free_shipping')->nullable();
			$table->string('seo_title')->nullable();
			$table->string('seo_description')->nullable();
			$table->string('brand')->nullable();
			$table->timestamps();
			$table->string('tags')->nullable();
			$table->string('status')->nullable();
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('tn_products');
	}

}
