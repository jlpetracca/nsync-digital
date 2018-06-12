<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTnCategoriesProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tnCategoriesProducts', function (Blueprint $table) {
            $table->increments('id');
            $table->string('tn_store_id')->nullable();
	        $table->string('product_id')->nullable();
	        $table->string('category_id')->nullable();
	        $table->string('mage_catalog_category_product_entity_id')->nullable();
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
        Schema::dropIfExists('tnCategoriesProducts');
    }
}
