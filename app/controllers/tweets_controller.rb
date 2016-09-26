class TweetsController < ApplicationController

    before_action :move_to_index, except: :index

  def index
     @tweets = Tweet.includes(:user).page(params[:page]).per(5).order('created_at DESC')
  end

  def new
  end

  def create
    @tweet = Tweet.create(text: tweet_params[:text], image: tweet_params[:image], user_id: current_user.id)
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy if current_user.id == tweet.user_id
  end

  def edit
    @teet = Tweet.find(params[:id])
  end

  def update
    tweet = Tweet.find(params[:id])
    tweet.update if current_user.id == tweet.user_id
  end

  private
  def tweet_params
    params.permit(:text, :image)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end