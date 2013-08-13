class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :logged_in

  def current_user
    @current_user = User.find_by_token(session[:session_token])
  end

  def logged_in
    redirect_to new_session_url unless current_user
  end
end
