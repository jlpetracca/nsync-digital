<?php
	use Illuminate\Support\Facades\Schema;
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
			$table->foreign('mage_attribute_id', 'fk_tn_attributes_mage_attributes_1')->references('id')->on('mage_eav_attribute')->onUpdate('RESTRICT')->onDelete('RESTRICT');
			$table->foreign('tn_store_id', 'fk_tn_attributes_tn_store_1')->references('id')->on('tn_store')->onUpdate('RESTRICT')->onDelete('RESTRICT');
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
			$table->dropForeign('fk_tn_attributes_mage_attributes_1');
			$table->dropForeign('fk_tn_attributes_tn_store_1');
		});
	}

}
