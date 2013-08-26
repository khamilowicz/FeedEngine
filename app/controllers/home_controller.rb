class HomeController < ApplicationController
  def index
   @feeds = Feed.pluck(:subdomain) 
  end
end
