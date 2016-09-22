class TweetsController < ApplicationController

  def index
     @tweets = Tweet.all.order('created_at DESC')
  end
end
