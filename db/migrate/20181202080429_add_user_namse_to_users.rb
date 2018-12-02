class AddUserNamseToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :user_name, :string
    add_column :users, :user_image_id, :string
    add_column :users, :user_sex, :integer
    add_column :users, :user_age, :string
    add_column :users, :user_region, :string
    add_column :users, :user_hobby, :string
    add_column :users, :user_introduction, :text
  end
end
