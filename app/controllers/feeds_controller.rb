class FeedsController < ApplicationController
  def index
    @feed = User.where(subdomain: subdomain).first.try(:main_feed) || render_404
  end
end
