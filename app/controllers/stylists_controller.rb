class StylistsController < ApplicationController

	def index
		@stylists = Stylist.all
	end

	def show
		@stylist = Stylist.find(params[:id])
		@isRoom = false
		if current_stylist != nil
			@currentStylistEntry=Entry.where(stylist_id: current_stylist.id)
	        @stylistEntry=Entry.where(stylist_id: @stylist.id)
	     	@currentStylistEntry.each do |cu|
		        @stylistEntry.each do |u|
		            if cu.room_id == u.room_id then
			            @isRoom = true
			            @roomId = cu.room_id
		            end
		            if @isRoom
		            else
			           	@room = Room.new
			            @entry = Entry.new
			        end
		        end
	        end
	    else
	    	# @room = UserChat.new
	    	if UserChat.find_by(user_id: current_user.id, stylist_id: @stylist.id)
	    		@userChat = UserChat.find_by(user_id: current_user.id, stylist_id: @stylist.id)
	    	else
	         	@room = UserChat.new
	        end

	    end
	end

	def edit
		@stylist = Stylist.find(params[:id])
	end



	def update
		@stylist = Stylist.find(params[:id])
		@stylist.update(stylist_params)
		redirect_to stylist_path(current_stylist)
	end


	private

	def stylist_params
		params.require(:stylist).permit(:stylist_name, :salon_name, :stylist_sex, :stylist_age, :stylist_region, :stylist_hobby, :email, :history, :stylist_introduction, :stylist_image)
	end
end
