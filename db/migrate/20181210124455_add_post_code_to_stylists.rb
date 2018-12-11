class AddPostCodeToStylists < ActiveRecord::Migration[5.2]
  def change
    add_column :stylists, :post_code, :string
    add_column :stylists, :address, :string
    add_column :stylists, :phone_number, :string
    add_column :stylists, :holiday, :string
    add_column :stylists, :business_houre, :string
    add_column :stylists, :menu, :string
    add_column :stylists, :salon_image_id, :string

    


  end
end
