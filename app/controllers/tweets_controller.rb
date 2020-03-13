class TweetsController < ApplicationController
  def index
  	@new_tweet = Tweet.new
  	@tweets = Tweet.includes(:user)
  end

  def new
  end

  def create
  	current_user.tweets.create!(tweet_params)
  	redirect_to tweets_path, notice: 'Created!'
  end

  private
  def tweet_params
  	params.require(:tweet).permit(:tweet)
  end
end
