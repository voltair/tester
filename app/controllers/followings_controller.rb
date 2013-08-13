class FollowingsController < ApplicationController

  def index
    @all_users = User.where("id != ?", current_user.id)
    @current_user = current_user
    followees_ids = current_user.followings.pluck(:followee_id)
    cannot_follow = followees_ids << current_user.id
    @unfollowed = User.where("id NOT IN (?)", cannot_follow)
    @followings = current_user.followings.includes(:followee)

    #@followees = @all_users.select {|user| followees_ids.include?(user.id)}
    # @unfollowed = @all_users - @followees
  end

  def create
    current_user.followings.create!(params[:following])
    redirect_to followings_url
  end

  def destroy
    Following.find(params[:id]).destroy
    redirect_to followings_url
  end
end
