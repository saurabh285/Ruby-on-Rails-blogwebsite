class ArticlesController < ApplicationController

  include	ArticlesHelper

  def	index
    puts session[:user]
    @user= User.where(email:session[:user]).first
    @articles	=	Article.all

  end
  def show
    @article	=	Article.find(params[:id])
    @comment	=	Comment.new
    @comment.article_id	=	@article.id
  end
  def new
    @article	=	Article.new
    end
  def	create
    @article	=	Article.new
    @article.title	=	params[:article][:title]
    @article.body	=	params[:article][:body]

    @article.save
    flash.notice	=	"Article	'#{@article.title}'	created!"

    redirect_to	article_path(@article)
  end
  def destroy
    @article	=	Article.find(params[:id])

    @article.delete
    redirect_to root_path
  end
  def	edit
    @article	=	Article.find(params[:id])
  end
  def update
    @article	=	Article.find(params[:id])
    @article.update(article_params)
    flash.notice	=	"Article	'#{@article.title}'	Updated!"
    redirect_to	article_path(@article)
  end

  def	tag_list
    self.tags.collect	do	|tag|
      tag.name
    end.join(",	")
  end
  def	tag_list=(tags_string)
    tag_names	=	tags_string.split(",").collect{|s|	s.strip.downcase}.uniq
    new_or_found_tags	=	tag_names.collect	{	|name|	Tag.find_or_create_by(name:	name)	}
    self.tags	=	new_or_found_tags
  end
end
