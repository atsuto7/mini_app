class TweetsController < ApplicationController
  def index
    @tweets = Tweet.order("created_at DESC")
  end
  
  def new
    @tweets = Tweet.new
  end
  
  def create
    Tweet.create(tweet_params)
    redirect_to root_path
  end
  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy 
    
  end
  def edit
    @tweets = Tweet.find(params[:id])
  end
  def update
    tweet = Tweet.find(params[:id])
    if tweet.user_id == current_user.id
      tweet.update(tweet_params)
    end
    redirect_to root_path
  end
  private
  def tweet_params  
    params.require(:tweet).permit(:text).merge(user_id: current_user.id)
  end
  
end
