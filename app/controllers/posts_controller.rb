class PostsController < ApplicationController
  before_filter :authenticate_user!

  def add_points
    redirect_to :back
  end
end