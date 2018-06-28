<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class AddForeignKeysToTnVariantsAttributesTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('tn_variants_attributes', function(Blueprint $table)
		{
			$table->foreign('attribute_value_id', 'tn_variants_attributes_tn_attribute_values_value_id_fk')->references('id')->on('tn_attributes_values')->onUpdate('RESTRICT')->onDelete('RESTRICT');
			$table->foreign('attribute_id', 'tn_variants_attributes_tn_attributes_id_fk')->references('id')->on('tn_attributes')->onUpdate('RESTRICT')->onDelete('RESTRICT');
			$table->foreign('product_id', 'tn_variants_attributes_tn_products_id_fk')->references('id')->on('tn_products')->onUpdate('RESTRICT')->onDelete('RESTRICT');
			$table->foreign('tn_store_id', 'tn_variants_attributes_tn_store_id_fk')->references('id')->on('tn_store')->onUpdate('RESTRICT')->onDelete('RESTRICT');
			$table->foreign('variant_id', 'tn_variants_attributes_tn_variant_id_fk')->references('id')->on('tn_variants')->onUpdate('RESTRICT')->onDelete('RESTRICT');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('tn_variants_attributes', function(Blueprint $table)
		{
			$table->dropForeign('tn_variants_attributes_tn_attribute_values_value_id_fk');
			$table->dropForeign('tn_variants_attributes_tn_attributes_id_fk');
			$table->dropForeign('tn_variants_attributes_tn_products_id_fk');
			$table->dropForeign('tn_variants_attributes_tn_store_id_fk');
			$table->dropForeign('tn_variants_attributes_tn_variant_id_fk');
		});
	}

}
