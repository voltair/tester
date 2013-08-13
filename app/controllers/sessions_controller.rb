class SessionsController < ApplicationController

  skip_before_filter :logged_in, :only => [:create, :new]

  def new
    render :new
  end

  def create
    user = User.find_by_username(params[:username])
    puts user
    if user.password == params[:password]
      session[:session_token] = user.token
      redirect_to user_url(user)
    else
      flash[:notice] ||= []
      flash[:notice] << "Login failed"
      redirect_to new_session_url
    end
  end

  def destroy
    session[:session_token] = nil
    redirect_to new_session_url
  end
end
