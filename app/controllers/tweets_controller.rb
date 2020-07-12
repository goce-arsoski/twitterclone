class TweetsController < ApplicationController
  before_action :find_tweet, only: [:show, :edit, :update, :destroy]

  def index
    @tweets = Tweet.all.order('created_at DESC')
  end

  def all
    @tweets = Tweet.all
    @user = User.find(params[:id])
  end

  def show
  end

  def new
    session_notice(:danger, 'You must be logged in!') unless logged_in?

    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user = current_user

    if @tweet.save
      redirect_to @tweet
    else
      render :new
    end
  end

  def edit
    session_notice(:danger, 'You must be logged in!') unless logged_in?

    if logged_in?
      session_notice(:danger, 'Wrong User') unless equal_with_current_user?(@tweet.user)
    end
  end

  def update
    if @tweet.update(tweet_params)
      redirect_to @tweet
    else
      render :edit
    end
  end

  def destroy
    session_notice(:danger, 'You must be logged in!') unless logged_in?

    if equal_with_current_user?(tweet.user)
      tweet.destroy
      redirect_to tweets_path
    else
      session_notice(:danger, 'Wrong User')
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:user, :content)
  end

  def find_tweet
    @tweet = Tweet.find(params[:id])
  end
end
