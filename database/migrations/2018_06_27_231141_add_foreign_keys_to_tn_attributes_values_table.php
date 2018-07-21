<?php

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
			$table->foreign('mage_value_id', 'tn_attributes_values_mage_eav_attribute_option_value_value_id_fk')->references('value_id')->on('mage_eav_attribute_option_value')->onUpdate('RESTRICT')->onDelete('RESTRICT');
			$table->foreign('attribute_id', 'tn_attributes_values_tn_attributes_id_fk')->references('id')->on('tn_attributes')->onUpdate('RESTRICT')->onDelete('RESTRICT');
			$table->foreign('tn_store_id', 'tn_attributes_values_tn_store_id_fk')->references('id')->on('tn_store')->onUpdate('RESTRICT')->onDelete('RESTRICT');
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
			$table->dropForeign('tn_attributes_values_mage_eav_attribute_option_value_value_id_fk');
			$table->dropForeign('tn_attributes_values_tn_attributes_id_fk');
			$table->dropForeign('tn_attributes_values_tn_store_id_fk');
		});
	}

}
