class FeedsController < ApplicationController
  def index
    @feed = subdomain_holder.try(:main_feed) || render_404
    @posts =@feed.posts.page params[:page]
  end
end
