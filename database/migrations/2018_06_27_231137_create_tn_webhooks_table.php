<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateTnWebhooksTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('tn_webhooks', function(Blueprint $table)
		{
			$table->integer('id')->nullable()->comment('Tienda Nube Webhook ID');
			$table->integer('tn_store_id')->nullable()->index('fk_tn_webhooks_tn_store_1');
			$table->string('event')->nullable();
			$table->string('url')->nullable();
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('tn_webhooks');
	}

}
