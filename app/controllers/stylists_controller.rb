class StylistsController < ApplicationController
    before_action :logged_in , only: [:index, :show]
    before_action :authenticate_stylist!, :only => [:edit]

	impressionist only: [:show]

	def index
		@stylists = Stylist.all
		@rank = Stylist.find(Follow.group(:stylist_id).order('count(stylist_id) desc').limit(30).pluck(:stylist_id))

	end

	def show
		@stylist = Stylist.find(params[:id])
		@isRoom = false
		@room = Room.new
		@entry = Entry.new
		if current_stylist != nil
			@currentStylistEntry=Entry.where(stylist_id: current_stylist.id)
	        @stylistEntry=Entry.where(stylist_id: @stylist.id)
	     	@currentStylistEntry.each do |cu|
			        @stylistEntry.each do |u|
			            if cu.room_id == u.room_id
				            @isRoom = true
				            @roomId = cu.room_id
				            break
				         else
				           	@room = Room.new
				            @entry = Entry.new
				        end
			        end
				if @isRoom == true
					break
				end
	        end

	        if @isRoom == false
				@room = Room.new
				@entry = Entry.new
			end


	        @chats = UserChat.where(stylist_id: current_stylist.id)
	    else
	    	if UserChat.find_by(user_id: current_user.id, stylist_id: @stylist.id)
	    		@userChat = UserChat.find_by(user_id: current_user.id, stylist_id: @stylist.id)
	    	else
	         	@room = UserChat.new
	        end

	    end

	    @rooms = []
	    @stylist.entries.each do |entry|
	    	@rooms.push(entry.room)
	    end

	    @other = []
	    @rooms.each do |room|
	    	@other.push(room.stylists.where.not(id: @stylist.id)[0])
	    end

	    @post = Post.where(stylist_id: @stylist.id)



	    impressionist(@stylist, nil, unique: [:session_hash])







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
		params.require(:stylist).permit(:stylist_name, :salon_name, :stylist_sex, :stylist_age, :stylist_region, :stylist_hobby, :email, :history, :stylist_introduction, :stylist_image, :post_code, :address, :phone_number, :holiday, :business_houre, :menu, :salon_image)
	end

	def logged_in
        unless user_signed_in? || stylist_signed_in?
            redirect_to root_path
            
        end
        
    end
end
