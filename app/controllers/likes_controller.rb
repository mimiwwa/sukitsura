class LikesController < ApplicationController

  before_action :authenticate_user!, only: [:create,:destroy]


  def create
    @article = Article.find(params[:article_id])
    @like = Like.create(create_params)
    @like.article_id = @article.id

    redirect_to "/articles/#{params[:article_id]}"
  end

  def destroy
    @like = Like.find_by(article_id: params[:article_id])
    @like.destroy
    redirect_to "/articles/#{params[:article_id]}"
  end

  private
  def create_params
    params.permit(:article_id).merge(user_id: current_user.id)
  end




end
