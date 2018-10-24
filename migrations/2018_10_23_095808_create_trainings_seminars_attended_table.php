<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTrainingsSeminarsAttendedTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('trainings_seminars_attended', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('trainor')->unsigned()->index();
            $table->string('title');
            $table->string('venue');
            $table->date('from');
            $table->date('to');
            $table->integer('certificate_types')->unsigned()->index();
            $table->float('no_of_hours', 8, 2);
            $table->integer('training_base')->unsigned()->index();
            $table->integer('category')->unsigned()->index();
            $table->string('conducted_by');
            $table->integer('proficiency')->unsigned()->index();
            $table->timestamps();

            $table->foreign('trainor')->references('id')->on('trainors_info');
            $table->foreign('certificate_types')->references('id')->on('certificate_types');
            $table->foreign('training_base')->references('id')->on('training_base_types');
            $table->foreign('category')->references('id')->on('category_types');
            $table->foreign('proficiency')->references('id')->on('proficiency_types');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('trainings_seminars_attended');
    }
}
