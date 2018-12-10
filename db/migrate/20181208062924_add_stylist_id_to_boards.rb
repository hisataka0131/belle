class AddStylistIdToBoards < ActiveRecord::Migration[5.2]
  def change
    add_column :boards, :stylist_id, :integer
  end
end
