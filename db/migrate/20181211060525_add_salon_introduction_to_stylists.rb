class AddSalonIntroductionToStylists < ActiveRecord::Migration[5.2]
  def change
    add_column :stylists, :salon_introduction, :text
    add_column :stylists, :salon_url, :string

  end
end
