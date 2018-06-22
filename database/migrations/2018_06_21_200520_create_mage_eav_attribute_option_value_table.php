<?php
	use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateMageEavAttributeOptionValueTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('mage_eav_attribute_option_value', function(Blueprint $table)
		{
			$table->integer('value_id')->primary();
			$table->integer('attribute_id')->nullable()->index('fk_mage_eav_attribute_option_value_mage_eav_attributes_1');
			$table->integer('option_id')->nullable();
			$table->string('value')->nullable();
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('mage_eav_attribute_option_value');
	}

}
