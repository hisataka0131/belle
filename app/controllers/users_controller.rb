class UsersController < ApplicationController
    before_action :logged_in , only: [:show]
    before_action :authenticate_user!, :only => [:edit]


	def top

	end


	def show
		@user = User.find(params[:id])
		@chats = UserChat.where(user_id: @user.id)
		@favorites = Favorite.where("user_id = ?", @user)
		@follows = Follow.where("user_id = ?", @user)

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


	def logged_in
        unless user_signed_in? || stylist_signed_in?
            redirect_to root_path
            
        end
        
    end

end
