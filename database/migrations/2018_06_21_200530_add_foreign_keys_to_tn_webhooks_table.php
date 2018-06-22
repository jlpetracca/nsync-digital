<?php
	use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class AddForeignKeysToTnWebhooksTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('tn_webhooks', function(Blueprint $table)
		{
			$table->foreign('tn_store_id', 'fk_tn_webhooks_tn_store_1')->references('id')->on('tn_store')->onUpdate('RESTRICT')->onDelete('RESTRICT');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('tn_webhooks', function(Blueprint $table)
		{
			$table->dropForeign('fk_tn_webhooks_tn_store_1');
		});
	}

}
