<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateFamilyBackgroundTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('family_background', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('trainor')->unsigned()->index();
            $table->string('spouse_name');
            $table->string('s_educational_attainment');
            $table->string('s_occupation');
            $table->float('s_average_monthly_income', 9, 2);
            $table->string('fathers_name');
            $table->string('f_educational_attainment');
            $table->string('f_occupation');
            $table->float('f_average_monthly_income', 9, 2);
            $table->string('mothers_name');
            $table->string('m_educational_attainment');
            $table->string('m_occupation');
            $table->float('m_average_monthly_income', 9, 2);
            $table->string('guardians_name');
            $table->string('g_educational_attainment');
            $table->string('g_occupation');
            $table->float('g_average_monthly_income', 9, 2);
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
        Schema::drop('family_background');
    }
}
