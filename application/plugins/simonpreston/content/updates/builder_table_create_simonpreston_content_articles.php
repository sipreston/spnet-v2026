<?php namespace SimonPreston\Article\Updates;

use Schema;
use Winter\Storm\Database\Updates\Migration;

class BuilderTableCreateSimonprestonContentArticles extends Migration
{
    public function up()
    {
        Schema::create('simonpreston_content_articles', function($table)
        {
            $table->engine = 'InnoDB';
            $table->id('id');
            $table->timestamp('created_at')->nullable();
            $table->timestamp('updated_at')->nullable();
            $table->string('title', 256);
            $table->text('slug');
            $table->bigInteger('author_id')->unsigned();
            $table->string('cover_image');
            $table->text('content')->nullable();
            $table->text('excerpt')->nullable();
            $table->bigInteger('view_count')->nullable()->unsigned()->default(0);
            $table->boolean('is_hidden')->nullable()->default(false);
            $table->boolean('is_published')->default(false);
            $table->timestamp('published_at')->nullable();
            $table->timestamp('deleted_at')->nullable();
            $table->text('metadata')->nullable();
        });

        Schema::create('simonpreston_content_categories', function($table) {
            $table->engine = 'InnoDB';
            $table->id('id');
            $table->timestamps();
            $table->string('name', 64);
            $table->string('slug', 64);
            $table->boolean('is_hidden')->default(false);
            $table->timestamp('deleted_at')->nullable();
            $table->text('description')->nullable();
            $table->boolean('is_parent')->default(false);
            $table->foreignId('parent_id')->nullable()->references('id')->on('simonpreston_content_categories')->onDelete('set null')->onUpdate('cascade');
        });

        Schema::create('simonpreston_content_article_category', function($table) {
            $table->engine = 'InnoDB';
            $table->foreignId('article_id')->references('id')->on('simonpreston_content_articles')->onDelete('cascade')->onUpdate('cascade');
            $table->foreignId('category_id')->references('id')->on('simonpreston_content_categories')->onDelete('cascade')->onUpdate('cascade');
        });
    }

    public function down()
    {
        Schema::dropIfExists('simonpreston_content_article_category');
        Schema::dropIfExists('simonpreston_content_categories');
        Schema::dropIfExists('simonpreston_content_articles');
    }
}
