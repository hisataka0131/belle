class UserChatsController < ApplicationController
    before_action :logged_in , only: [:show]
  
  def show
  	@user_chat = UserChat.find(params[:id])
  	@stylist = Stylist.find(@user_chat.stylist.id)
  	@user = User.find(@user_chat.user.id)
  	@message = ChatMessage.where(user_chat_id: params[:id])
  	@message_new = ChatMessage.new
  end


  def create

  	room = UserChat.new(room_params)
  	room.user_id = current_user.id
  	if room.save
  		redirect_to user_chat_path(room.id)
  	else
  		redirect_to root_path
  	end
  end

  private
  	def room_params
  		params.require(:user_chat).permit(:stylist_id)
  	end


    def logged_in
        unless user_signed_in? || stylist_signed_in?
            redirect_to root_path
            
        end
        
    end



end
