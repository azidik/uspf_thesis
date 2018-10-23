<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCompetencyAssessmentPassedTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('competency_assessment_passed', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('trainor')->unsigned()->index();
            $table->string('industry_sector');
            $table->string('trade_area');
            $table->string('occupation');
            $table->string('classification_level');
            $table->string('competency');
            $table->string('specialization_description');
            $table->timestamps();

            $table->foreign('trainor')->references('id')->on('trainors_info');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('competency_assessment_passed');
    }
}
