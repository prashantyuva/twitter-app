class TweetsController < ApplicationController
  before_action :check_if_user_present, only: [:index]

  def index
  	@new_tweet = Tweet.new
    if @user
      @tweets = @user.my_tweets.includes(:user)
    else
  	 @tweets = current_user.tweets.includes(:user)
    end
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

  def check_if_user_present
    if params[:user_id]
      @user = User.find_by_uid(params[:user_id])
    end
  end
end
