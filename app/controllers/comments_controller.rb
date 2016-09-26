class CommentsController < ApplicationController
  def create
    @comment = Comment.create(text: comments_params[:text], tweet_id: comments_params[:tweet_id], user_id: current_user.id)
    redirect_to "/tweets/#{@comment.tweet.id}"
  end

  private
  def comments_params
    params.permit(:text, :tweet_id)
  end
end
