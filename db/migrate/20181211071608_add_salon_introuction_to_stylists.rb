class AddSalonIntrouctionToStylists < ActiveRecord::Migration[5.2]
  def change
    add_column :stylists, :latitude, :float
    add_column :stylists, :longitude, :float

  end
end
