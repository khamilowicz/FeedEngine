class PostsController < ApplicationController

  before_filter :authenticate_user!, except: [:refeed]

  def add_points
    post = current_feed.posts.find(params[:id])
    post.add_points
    post.save
    redirect_to :back
  end

  def create
    current_feed.posts.create(post_params)
    @posts = current_feed.posts.all
    redirect_to :back
  end

  def refeed
    post = Post.find(params[:id])
    current_user.add_to_main_feed post
    redirect_to :back
  end

  private 

  def post_params
    params.require(:post).permit(:title, :description)
  end
end