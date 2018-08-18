<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class AddForeignKeysToMageEavAttributeOptionValueTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('mage_eav_attribute_option_value', function(Blueprint $table)
		{
			$table->foreign('attribute_id', 'mage_eav_attribute_option_value_mage_eav_attribute_id_fk')->references('id')->on('mage_eav_attribute')->onUpdate('RESTRICT')->onDelete('RESTRICT');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('mage_eav_attribute_option_value', function(Blueprint $table)
		{
			$table->dropForeign('mage_eav_attribute_option_value_mage_eav_attribute_id_fk');
		});
	}

}
