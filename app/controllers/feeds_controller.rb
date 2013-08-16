class FeedsController < ApplicationController
  def index
    @feed = subdomain_holder.try(:main_feed) || render_404
  end
end
