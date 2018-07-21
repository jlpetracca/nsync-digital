<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateTnVariantsAttributesTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('tn_variants_attributes', function(Blueprint $table)
		{
			$table->integer('id', true);
			$table->integer('tn_store_id')->index('tn_variants_attributes_tn_store_id_fk');
			$table->integer('product_id')->index('tn_variants_attributes_tn_products_id_fk');
			$table->integer('variant_id')->index('tn_variants_attributes_tn_variant_id_fk');
			$table->integer('attribute_id')->index('tn_variants_attributes_tn_attributes_id_fk');
			$table->integer('attribute_value_id')->index('tn_variants_attributes_tn_attribute_values_value_id_fk');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('tn_variants_attributes');
	}

}
