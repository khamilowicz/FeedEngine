class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
   @user = subdomain_holder || render_404
  end

  def profile
    @user = subdomain_holder || render_404
  end

  def update
  end

  def create
  end

  def destroy
  end
end
