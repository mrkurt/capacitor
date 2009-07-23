# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  before_filter :current_user # loads up current user instance variable

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password
  
  protected

  def authentication_failed(message, destination='/')
    flash[:error] = message
    redirect_to destination
  end

  def authentication_succeeded(message = 'You have logged in successfully.', destination = '/')
    flash[:notice] = message
    redirect_back_or_default destination
  end

  def current_user
    @current_user ||= 
      if session[:user_id]
        User.find_by_id(session[:user_id])
      else
        false
      end
  end

  def current_user=(new_user)
    session[:user_id] = new_user.id
    @current_user = new_user
  end

  def authorized?
    !!current_user
  end

  def login_required
    authorized? || access_denied 
  end

  def access_denied
    store_location
    redirect_to login_path
  end

  def store_location
    session[:return_to] = request.request_uri
  end

  def redirect_back_or_default(default)
    url = params[:return_to]
    url ||= session[:return_to]
    session[:return_to] = nil
    redirect_to(url || default)
  end

  def logged_in?
    !!current_user
  end

  def logout_keeping_session!
    session[:user_id] = nil
    @current_user = nil
    cookies.delete(:remember_token)
  end
end
