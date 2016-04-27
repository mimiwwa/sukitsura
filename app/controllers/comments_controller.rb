class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params.merge(user_id:current_user.id))
    redirect_to "/articles/#{@comment.article.id}"
  end


  private
  def comment_params
    params.permit(:text, :article_id)
  end
end


