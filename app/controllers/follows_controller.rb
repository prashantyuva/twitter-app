class FollowsController < ApplicationController
  before_action :set_user#, only: [:create, :destroy]

  def followers
    @users = User.where(id: @user.followings.pluck(:id))
    render template: 'shared/users_list'
  end

  def following
    @users = @user.following_user
    render template: 'shared/users_list'
  end

  def create
    unless current_user.following?(@user)
      current_user.follow(@user)
      redirect_back(fallback_location: root_path, notice: "Now Following: #{@user.uid}")
    else
      redirect_back(fallback_location: root_path, alert: "You are already following #{@user.uid}")
    end
  end

  def destroy
    if current_user.following?(@user)
      current_user.stop_following(@user)
      redirect_back(fallback_location: root_path, notice: "Unfollowed: #{@user.uid}")
    else
      redirect_back(fallback_location: root_path, alert: "You are not following #{@user.uid}")
    end
  end

  private
  def set_user
    @user = User.find_by_uid(params.require(:user_id))
    redirect_back(fallback_location: root_path, alert: "No User Found: #{params[:user_id]}") unless @user
  end
end
