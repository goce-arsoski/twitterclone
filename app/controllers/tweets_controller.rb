class TweetsController < ApplicationController
  before_action :find_tweet, only: [:show, :edit, :update, :destroy]

  def index
    @tweets = Tweet.all.order('created_at DESC')
  end

  def all
    @tweets = Tweet.all
    @user = params[:id]
  end

  def show
    @comments = @tweet.comments.order(id: :desc)
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)

    if @tweet.save
      redirect_to @tweet
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @tweet.update(tweet_params)
      redirect_to @tweet
    else
      render :edit
    end
  end

  def destroy
    @tweet.destroy

    redirect_to tweets_path
  end

  private

  def tweet_params
    params.require(:tweet).permit(:user, :content)
  end

  def find_tweet
    @tweet = Tweet.find(params[:id])
  end
end
