class AddStylistIdToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :stylist_id, :integer
  end
end
