class FollowersController < ApplicationController
  before_action :find_user

  def index
    @followers = @user.followers
  end

  private

  def find_user
    @user ||= User.find_by(username: params[:user_id])
  end
end
