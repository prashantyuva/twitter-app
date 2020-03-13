class FollowsController < ApplicationController

  def index
    
  end

  def create
    user = User.find_by_uid(params.require(:uid))
    unless current_user.following?(user)
      current_user.follow(user)
    end
    redirect_to :back
  end

  def destroy
    user = User.find_by_uid(params.require(:id))
    if current_user.following?(user)
      current_user.stop_following(user)
    end
    redirect_to :back
  end
end
