class PostsController < ApplicationController

  before_filter :authenticate_user!, except: [:refeed]

  def add_points
    post = Post.find(params[:id])
    post.add_points
    post.save
    redirect_to :back
  end

  def create
    current_feed.posts.create(post_params)
    redirect_to :back
  end

  def refeed
    post = Post.find(params[:id])
    current_user.add_to_main_feed post
    redirect_to :back
  end

  private 

  def post_params
    if params.key? :post
      params.require(:post).permit(:title, :description)
    elsif params.key? :photo_post
      params.require(:photo_post).permit(:photo, :title, :description, :type)
    end
  end
end