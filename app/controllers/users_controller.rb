class UsersController < ApplicationController


    def show
      user = User.find(params[:id])
      @user_id = user.id
      @nickname = user.nickname
      @articles = user.articles.page(params[:page]).per(5).order("created_at DESC")
      @ariticle_count = user.articles.count
      @likes = user.likes.count
      @liked = Article.where(user_id: params[:id]).sum(:like_count)
    end


end
