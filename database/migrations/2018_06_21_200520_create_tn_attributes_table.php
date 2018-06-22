<?php
	use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateTnAttributesTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('tn_attributes', function(Blueprint $table)
		{
			$table->integer('id')->primary();
			$table->integer('tn_store_id')->nullable()->index('fk_tn_attributes_tn_store_1');
			$table->string('name')->nullable();
			$table->integer('mage_attribute_id')->nullable()->index('fk_tn_attributes_mage_attributes_1');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('tn_attributes');
	}

}
