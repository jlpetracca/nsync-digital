<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTnProductImagesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tnProductImages', function (Blueprint $table) {
	        $table->increments('id');
	        $table->string('tn_store_id')->nullable();
	        $table->string('product_id')->nullable();
	        $table->string('image_id')->nullable();
	        $table->string('src')->nullable();
	        $table->string('alt')->nullable();
	        $table->string('position')->nullable();
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
        Schema::dropIfExists('tnImages');
    }
}
