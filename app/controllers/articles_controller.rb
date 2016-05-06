class ArticlesController < ApplicationController

  before_action :move_to_index, except: :index

  def index
    @articles = Article.includes(:user).all.order("updated_at DESC").page(params[:page]).per(20)
  end

  def new
    @articles =Article.new
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
  end




  private
    def article_params
      params.require(:article).permit(:text)
    end

    def move_to_index
      redirect_to action: :index unless user_signed_in?
    end

end
