class RoomsController < ApplicationController
  before_action :authenticate_stylist!


  def create
    @room = Room.create
    @entry1 = Entry.create(:room_id => @room.id, :stylist_id => current_stylist.id)
    @entry2 = Entry.create(params.require(:entry).permit(:stylist_id, :room_id).merge(:room_id => @room.id))
    redirect_to "/rooms/#{@room.id}"
  end

  def show
    @room = Room.find(params[:id])
    if Entry.where(:stylist_id => current_stylist.id, :room_id => @room.id).present?
      @messages = @room.messages
      @message = Message.new
      @entries = @room.entries
    else
      redirect_back(fallback_location: root_path)
    end
  end

end
