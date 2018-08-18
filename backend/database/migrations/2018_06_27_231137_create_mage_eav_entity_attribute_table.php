<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateMageEavEntityAttributeTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('mage_eav_entity_attribute', function(Blueprint $table)
		{
			$table->integer('attribute_set_id')->primary();
			$table->integer('attribute_id')->nullable()->index('fk_mage_eav_entity_attribute_mage_eav_attribute_1');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('mage_eav_entity_attribute');
	}

}
