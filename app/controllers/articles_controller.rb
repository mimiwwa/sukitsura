class ArticlesController < ApplicationController

  
  before_action :authenticate_user!, only: [:new,:destroy]


  def index
    @article =Article.new
    @articles = Article.includes(:user).all.order("updated_at DESC").page(params[:page]).per(20)
  end

  def new
    @article =Article.new
  end

  def create
    Article.create(article_params.merge(user_id: current_user.id))
  end

  def destroy
      article = Article.find(params[:id])
      if article.user_id == current_user.id
        article.destroy
      end
  end

  def show
    @article = Article.find(params[:id])
    @comments = @article.comments.includes(:user)
    @article_title = article_title+"さんの好きすぎて辛い想い"
  end




  private
    def article_params
      params.require(:article).permit(:text)
    end

    def move_to_index
      redirect_to action: :index unless user_signed_in?
    end

    def article_title
      article_title=""
      if @article.user_id == 1
        article_title = @article.tw_username
      else
        article_title = @article.user.nickname
      end
      return article_title
    end

end
