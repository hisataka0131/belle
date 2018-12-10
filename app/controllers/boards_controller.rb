class BoardsController < ApplicationController
  def index
  	@boards = Board.all
  end

  def show
  	@board = Board.find(params[:id])
  	@board_comment = BoardComment.new
  end

  def edit
  	@board = Board.find(params[:id])
  end

  def new
  	@board = Board.new
  end

  def create
	 board = Board.new(params_board)
     board.stylist_id = current_stylist.id
     board.save
     redirect_to boards_path
  end

  def update
    @board = Board.find(params[:id])
	   if @board.update_attributes(params_board)
	       redirect_to board_path(@board)
	     else
	       render "edit"
	   end
  end

  def destroy
    @board = Board.find(params[:id])
	@board.destroy
	redirect_to boards_path
  end

  private

  def params_board
  	params.require(:board).permit(:title, :content, :stylist_id)

  end

end
