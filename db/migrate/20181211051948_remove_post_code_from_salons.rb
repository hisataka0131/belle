class RemovePostCodeFromSalons < ActiveRecord::Migration[5.2]
  def change
    remove_column :salons, :post_code, :string
    remove_column :salons, :address, :string
    remove_column :salons, :phone_number, :string
    remove_column :salons, :menu, :text
    remove_column :salons, :holiday, :string
    remove_column :salons, :business_houre, :string
  end
end
