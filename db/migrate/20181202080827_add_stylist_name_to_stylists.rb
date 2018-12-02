class AddStylistNameToStylists < ActiveRecord::Migration[5.2]
  def change
    add_column :stylists, :stylist_name, :string
    add_column :stylists, :salon_name, :string
    add_column :stylists, :stylist_image_id, :string
    add_column :stylists, :stylist_sex, :integer
    add_column :stylists, :stylist_age, :string
    add_column :stylists, :stylist_region, :string
    add_column :stylists, :stylist_hobby, :string
    add_column :stylists, :fort, :string
    add_column :stylists, :history, :string
    add_column :stylists, :stylist_introduction, :text

  end
end
