class PostsController < ApplicationController

  before_filter :authenticate_user!, except: [:refeed]

  def add_points
    redirect_to :back
  end

  def refeed
    post = Post.find(params[:id])
    current_user.add_to_main_feed post
    redirect_to :back
  end
end