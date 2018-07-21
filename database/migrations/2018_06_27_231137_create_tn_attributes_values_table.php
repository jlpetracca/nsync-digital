<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateTnAttributesValuesTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('tn_attributes_values', function(Blueprint $table)
		{
			$table->integer('id', true);
			$table->integer('tn_store_id')->index('fk_tn_variants_attributes_tn_store_1');
			$table->integer('attribute_id')->index('fk_tn_variants_attributes_tn_attributes_1');
			$table->string('value')->nullable();
			$table->integer('mage_value_id')->nullable()->index('fk_tn_variants_attributes_mage_eav_attribute_option_1');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('tn_attributes_values');
	}

}
