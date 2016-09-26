class CommentsController < ApplicationController
  def create
    Comment.create(text: comments_params[:text], tweet_id: comments_params[:text], user_id: current_user.id)
  end

  private
  def comments_params
    params.permit(:text, :tweet_id)
end
