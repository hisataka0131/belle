class Commet < ActiveRecord::Migration[5.2]
  def change

  	drop_table :post_commets
  end
end