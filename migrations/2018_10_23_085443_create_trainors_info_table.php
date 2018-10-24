<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTrainorsInfoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('trainors_info', function (Blueprint $table) {
            $table->increments('id');
            $table->string('fname');
            $table->string('lname');
            $table->string('mname');
            $table->string('sex');
            $table->integer('civil_status')->unsigned()->index();
            $table->date('bdate');
            $table->string('bplace');
            $table->string('citizenship');
            $table->string('religion');
            $table->float('height', 9, 2);
            $table->float('weight', 9, 2);
            $table->string('bloodtype');
            $table->string('sss_no');
            $table->string('gsis_no');
            $table->string('tin_no');
            $table->string('distinguishing_remarks');
            $table->integer('designation')->unsigned()->index();
            $table->integer('application_status')->unsigned()->index();
            $table->date('application_status_result_at')->nullable();
            $table->integer('application_status_result_by')->nullable()->unsigned()->index();
            $table->timestamps();

            $table->foreign('civil_status')->references('id')->on('civil_statuses');
            $table->foreign('designation')->references('id')->on('designations');
            $table->foreign('application_status')->references('id')->on('statuses');
            $table->foreign('application_status_result_by')->references('id')->on('users');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('trainors_info');
    }
}
