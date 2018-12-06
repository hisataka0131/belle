class UsersController < ApplicationController

	def top

	end


	def show
		@user = User.find(params[:id])

	end

	def edit
		@user = User.find(params[:id])
	end



	def update
		@user = User.find(params[:id])
		@user.update(stylist_params)
		redirect_to user_path(current_user)
	end


	private

	def stylist_params
		params.require(:user).permit(:user_name, :user_sex, :user_age, :user_region, :user_hobby, :email,:user_introduction, :user_image)
	end
end
