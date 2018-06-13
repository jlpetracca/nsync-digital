<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTnAttributesValuesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tnAttributesValues', function (Blueprint $table) {
            $table->increments('id');
	        $table->string('tn_store_id')->nullable();
	        $table->string('value')->nullable();
	        $table->string('mage_value_id')->nullable();
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
        Schema::dropIfExists('tnAttributesValues');
    }
}
