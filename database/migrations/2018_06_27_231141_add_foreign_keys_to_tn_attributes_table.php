<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class AddForeignKeysToTnAttributesTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('tn_attributes', function(Blueprint $table)
		{
			$table->foreign('mage_attribute_id', 'tn_attributes_mage_eav_attribute_id_fk')->references('id')->on('mage_eav_attribute')->onUpdate('RESTRICT')->onDelete('RESTRICT');
			$table->foreign('tn_store_id', 'tn_attributes_tn_store_id_fk')->references('id')->on('tn_store')->onUpdate('RESTRICT')->onDelete('RESTRICT');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('tn_attributes', function(Blueprint $table)
		{
			$table->dropForeign('tn_attributes_mage_eav_attribute_id_fk');
			$table->dropForeign('tn_attributes_tn_store_id_fk');
		});
	}

}
