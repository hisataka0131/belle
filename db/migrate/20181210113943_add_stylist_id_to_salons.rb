class AddStylistIdToSalons < ActiveRecord::Migration[5.2]
  def change
    add_column :salons, :stylist_id, :integer
  end
end
