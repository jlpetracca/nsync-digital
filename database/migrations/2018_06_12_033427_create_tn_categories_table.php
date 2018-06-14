<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTnCategoriesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tnCategories', function (Blueprint $table) {
            $table->increments('id');
            $table->string('tn_store_id')->nullable();
	        $table->string('handle')->nullable();
	        $table->string('category_id')->nullable();
	        $table->string('name')->nullable();
	        $table->string('description')->nullable();
	        $table->string('parent')->nullable();
	        $table->string('subcategories')->nullable();
	        $table->string('seo_title')->nullable();
	        $table->string('seo_description')->nullable();
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
