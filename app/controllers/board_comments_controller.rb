class BoardCommentsController < ApplicationController

	def create

		 board = Board.find(params[:board_id])
         comment = current_stylist.board_comments.new(board_comment_params)
         comment.board_id = board.id
         comment.save
         redirect_to board_path(board)


    end

    private
     def board_comment_params
       params.require(:board_comment).permit(:stylist_id,:board_id,:comment)

    end
end
