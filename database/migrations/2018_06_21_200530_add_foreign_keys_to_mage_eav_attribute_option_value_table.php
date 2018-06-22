<?php
	use Illuminate\Support\Facades\Schema;
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
			$table->foreign('attribute_id', 'fk_mage_eav_attribute_option_value_mage_eav_attributes_1')->references('id')->on('mage_eav_attribute')->onUpdate('RESTRICT')->onDelete('RESTRICT');
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
			$table->dropForeign('fk_mage_eav_attribute_option_value_mage_eav_attributes_1');
		});
	}

}
