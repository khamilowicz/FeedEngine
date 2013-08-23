class FeedsController < ApplicationController
  before_action :new_feed
  before_action :private_feed_lock, except: [:ask_for_access]

  def index
    @posts = current_feed.posts.page params[:page]
  end

  def add_service
    if params[:add] == 'false'
      current_feed.unsubscribe :twitter, params[:twitter_id]
    else
      current_feed.subscribe :twitter, params[:twitter_id]
    end
    redirect_to :back
  end

  def approve_access
    user = User.find(params[:user_id])
    current_feed.allow(user).save
    redirect_to :back
  end

  def toggle_visibility
    current_feed.toggle(:public).save
    redirect_to :back
  end

  def ask_for_access
    FeedManager.ask_for_access(current_user, current_feed)
    redirect_to :back
  end

  private

  def private_feed_lock
    unless current_feed.allow?(current_user)
      render 'not_allowed'
    end
  end

  def new_feed
    unless current_feed
      redirect_to root_url
    end
  end
end
