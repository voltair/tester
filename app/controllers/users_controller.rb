class UsersController < ApplicationController

  before_filter :authorized, :only => [:show]

  def show
    @user = User.find(params[:id])
  end

  def new
    render :new
  end

  def create
    user = User.create!(params[:user])
    session[:session_token] = user.token
    redirect_to user_url(user)
  end

  def authorized
    unless current_user.id.to_s == params[:id]
      redirect_to user_url(current_user)
    end
  end

end
