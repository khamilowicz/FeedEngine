class FeedsController < ApplicationController
  before_action :private_feed_lock, except: [:ask_for_access]

  def index
    @posts = current_feed.posts.page params[:page]
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
end
