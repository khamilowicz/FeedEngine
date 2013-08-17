class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
   @user = User.where(id: params[:id]).first || render_404
  end

  def profile
    @user = User.where(id: params[:id]).first || render_404
  end

  def update
  end

  def create
  end

  def destroy
  end
end
