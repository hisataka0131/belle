class AddBoardImgToBoards < ActiveRecord::Migration[5.2]
  def change
    add_column :boards, :board_image_id, :string
  end
end
