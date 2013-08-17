class FeedsController < ApplicationController
  before_action :private_feed_lock

  def index
    @posts =@feed.posts.page params[:page]
  end

  private

  def private_feed_lock
    @feed = subdomain_holder.try(:main_feed) || render_404
    unless @feed.allow?(current_user)
      render 'not_allowed'
    end
  end
end
