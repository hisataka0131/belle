class MessagesController < ApplicationController

	before_action :authenticate_stylist!, :only => [:create]

  def create
    if Entry.where(:stylist_id => current_stylist.id, :room_id => params[:message][:room_id]).present?
      @message = Message.create(params.require(:message).permit(:stylist_id, :content, :room_id).merge(:stylist_id => current_stylist.id))
      redirect_to "/rooms/#{@message.room_id}"
    else
      redirect_back(fallback_location: root_path)
    end
  end
end
