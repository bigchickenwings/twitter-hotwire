class LikesController < ApplicationController
  before_action :require_login, :set_tweet, only: %i[ create destroy ]

  def create
    return if current_user.likes.find_by(tweet_id: @tweet.id)
    @like = current_user.likes.new(tweet: @tweet)

    respond_to do |format|
      if @like.save
        format.html { redirect_to tweet_url(@tweet), notice: "You have liked this tweet." }
        format.json { render :show, status: :created, location: @tweet }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @like = current_user.likes.find_by(tweet_id: @tweet.id)
    return unless @like

    @like.destroy

    respond_to do |format|
      format.html { redirect_to tweets_url, notice: "You have unliked this tweet." }
      format.json { head :no_content }
    end
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:tweet_id])
  end
end