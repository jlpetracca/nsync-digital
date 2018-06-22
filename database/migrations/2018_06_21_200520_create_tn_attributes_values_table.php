<?php
	use Illuminate\Support\Facades\Schema;
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
			$table->integer('id')->primary();
			$table->integer('tn_store_id')->index('fk_tn_attributes_values_tn_store_1');
			$table->integer('attribute_id')->index('fk_tn_attributes_values_tn_attributes_1');
			$table->integer('product_id')->nullable()->index('fk_tn_attributes_values_tn_products_1');
			$table->integer('variant_id')->nullable()->index('fk_tn_attributes_values_tn_variants_1');
			$table->string('value')->nullable();
			$table->integer('mage_value_id')->nullable()->index('fk_tn_attributes_values_mage_eav_attribute_option_1');
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
