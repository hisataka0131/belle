class ChatMessagesController < ApplicationController



	def create
		message = ChatMessage.new(chat_message_params)

		if current_stylist != nil

	 		message.stylist = true



	    else
	    	message.stylist = false

	    end

	    message.save
	    redirect_to user_chat_path(message.user_chat_id)
      
    end

    private 

    def chat_message_params
		params.require(:chat_message).permit(:content, :user_chat_id)
	end
end
