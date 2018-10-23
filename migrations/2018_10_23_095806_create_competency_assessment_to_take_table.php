<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCompetencyAssessmentToTakeTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('competency_assessment_to_take_table', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('trainor')->unsigned()->index();
            $table->date('date_of_application');
            $table->string('sector_component');
            $table->string('trade_area');
            $table->string('occupation');
            $table->string('classification');
            $table->string('competency');
            $table->integer('training_program')->unsigned()->index();
            $table->integer('program_sector')->unsigned()->index();
            $table->integer('client_type')->unsigned()->index();
            $table->timestamps();

            $table->foreign('trainor')->references('id')->on('trainors_info');
            $table->foreign('training_program')->references('id')->on('training_program');
            $table->foreign('program_sector')->references('id')->on('program_sector');
            $table->foreign('client_type')->references('id')->on('client_type');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('competency_assessment_to_take_table');
    }
}
