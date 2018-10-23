<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateLicensesExaminationPassedTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('licenses_examination_passed', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('trainor')->unsigned()->index();
            $table->string('title');
            $table->year('year_taken');
            $table->string('examination_venue');
            $table->string('rating');
            $table->string('remarks');
            $table->date('expiry_date');
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
        Schema::drop('licenses_examination_passed');
    }
}
