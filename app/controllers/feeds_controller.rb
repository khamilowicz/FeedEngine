class FeedsController < ApplicationController
  before_action :private_feed_lock, except: [:ask_for_access]

  def index
    @posts =@feed.posts.page params[:page]
  end

  def ask_for_access
    pleader = current_user
    feed = subdomain_holder.try(:main_feed) 
    FeedManager.ask_for_access(pleader.id, feed.id)
    redirect_to :back
  end

  private

  def private_feed_lock
    @feed = subdomain_holder.try(:main_feed) 
    unless @feed.allow?(current_user)
      render 'not_allowed'
    end
  end
end
