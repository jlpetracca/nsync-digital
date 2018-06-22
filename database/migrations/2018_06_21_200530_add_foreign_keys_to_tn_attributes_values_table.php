<?php
	use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class AddForeignKeysToTnAttributesValuesTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('tn_attributes_values', function(Blueprint $table)
		{
			$table->foreign('mage_value_id', 'fk_tn_attributes_values_mage_eav_attribute_option_1')->references('value_id')->on('mage_eav_attribute_option_value')->onUpdate('RESTRICT')->onDelete('RESTRICT');
			$table->foreign('attribute_id', 'fk_tn_attributes_values_tn_attributes_1')->references('id')->on('tn_attributes')->onUpdate('RESTRICT')->onDelete('RESTRICT');
			$table->foreign('product_id', 'fk_tn_attributes_values_tn_products_1')->references('id')->on('tn_products')->onUpdate('RESTRICT')->onDelete('RESTRICT');
			$table->foreign('tn_store_id', 'fk_tn_attributes_values_tn_store_1')->references('id')->on('tn_store')->onUpdate('RESTRICT')->onDelete('RESTRICT');
			$table->foreign('variant_id', 'fk_tn_attributes_values_tn_variants_1')->references('id')->on('tn_variants')->onUpdate('RESTRICT')->onDelete('RESTRICT');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('tn_attributes_values', function(Blueprint $table)
		{
			$table->dropForeign('fk_tn_attributes_values_mage_eav_attribute_option_1');
			$table->dropForeign('fk_tn_attributes_values_tn_attributes_1');
			$table->dropForeign('fk_tn_attributes_values_tn_products_1');
			$table->dropForeign('fk_tn_attributes_values_tn_store_1');
			$table->dropForeign('fk_tn_attributes_values_tn_variants_1');
		});
	}

}
