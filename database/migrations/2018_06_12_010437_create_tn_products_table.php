<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTnProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tnProducts', function (Blueprint $table) {
            $table->increments('id');
	        $table->string('product_id')->nullable();
            $table->string('tn_store_id')->nullable();
            $table->string('mage_status_id')->nullable();
	        $table->string('category_id')->nullable();
	        $table->string('name')->nullable();
	        $table->string('description')->nullable();
	        $table->string('handle')->nullable();
	        $table->string('published')->nullable();
	        $table->string('free_shipping')->nullable();
	        $table->string('seo_title')->nullable();
	        $table->string('seo_description')->nullable();
	        $table->string('brand')->nullable();
	        $table->string('tags')->nullable();
	        $table->string('status')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('tnProducts');
    }
}
