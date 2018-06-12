<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTnVariantsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tnVariants', function (Blueprint $table) {
            $table->increments('id');
            $table->string('tn_store_id')->nullable();
	        $table->string('product_id')->nullable();
	        $table->string('image_id')->nullable();
	        $table->string('position')->nullable();
	        $table->string('price')->nullable();
	        $table->string('promotional_price')->nullable();
	        $table->string('stock_management')->nullable();
	        $table->string('stock')->nullable();
	        $table->string('weight')->nullable();
	        $table->string('width')->nullable();
	        $table->string('height')->nullable();
	        $table->string('depth')->nullable();
	        $table->string('sku')->nullable();
	        $table->string('barcode')->nullable();
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
        Schema::dropIfExists('tnVariants');
    }
}
