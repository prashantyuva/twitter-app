class UsersController < ApplicationController
	def index
		@users = User.where.not(id: current_user)
    render template: 'shared/users_list'
	end

  def show
  	@user = User.find_by_uid(params[:id])
  	redirect_back(fallback_location: root_path, alert: "No User Found: #{params[:id]}") unless @user
  end
end
