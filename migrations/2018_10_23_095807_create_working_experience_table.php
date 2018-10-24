<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateWorkingExperienceTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('working_experience_table', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('trainor')->unsigned()->index();
            $table->string('company_name');
            $table->string('position');
            $table->date('from');
            $table->date('to');
            $table->decimal('monthly_salary', 9, 2);
            $table->integer('occupation_type')->unsigned()->index();
            $table->string('status_of_appointment');
            $table->float('no_of_years_working_exp', 9, 2);
            $table->timestamps();

            $table->foreign('trainor')->references('id')->on('trainors_info');
            $table->foreign('occupation_type')->references('id')->on('occupation_types');


        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('working_experience_table');
    }
}
