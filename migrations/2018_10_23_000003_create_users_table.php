<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->increments('id');
            $table->string('username');
            $table->string('password');
            $table->string('fname');
            $table->string('mname');
            $table->string('lname');
            $table->integer('user_type')->unsigned()->index();
            $table->integer('designation')->nullable()->unsigned()->index();
            $table->rememberToken();
            $table->timestamps();

            $table->foreign('user_type')->references('id')->on('user_types');
            $table->foreign('designation')->references('id')->on('designations');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('users');
    }
}
