class ApplicationController < ActionController::Base
# Prevent CSRF attacks by raising an exception.
# For APIs, you may want to use :null_session instead.
protect_from_forgery with: :exception

private

def subdomain
  # request.subdomain.downcase
  params[:feed]
end

def current_feed
  @feed ||= Feed.where(subdomain: subdomain).first
end

def subdomain_holder
  @subdomain_holder ||= current_feed.owner
end

def after_sign_in_path_for user
  profile_user_path(user)
end

def render_404
  respond_to do |format|
    format.html { render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found }
    format.xml  { head :not_found }
    format.any  { head :not_found }
  end
end
end
