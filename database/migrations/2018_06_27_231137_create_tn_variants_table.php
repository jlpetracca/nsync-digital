<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateTnVariantsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('tn_variants', function(Blueprint $table)
		{
			$table->integer('id')->primary();
			$table->integer('tn_store_id')->nullable()->index('tn_store_id');
			$table->integer('product_id')->nullable()->index('fk_tn_variants_tn_products_1');
			$table->integer('image_id')->nullable()->index('fk_tn_variants_tn_product_image_1');
			$table->string('position')->nullable();
			$table->decimal('price', 10)->nullable();
			$table->decimal('promotional_price', 10)->nullable();
			$table->string('stock_management')->nullable();
			$table->string('stock')->nullable();
			$table->float('weight', 22, 0)->nullable();
			$table->float('width', 22, 0)->nullable();
			$table->float('height', 22, 0)->nullable();
			$table->string('depth')->nullable();
			$table->string('sku')->nullable();
			$table->string('barcode')->nullable();
			$table->timestamps();
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
		Schema::drop('tn_variants');
	}

}
