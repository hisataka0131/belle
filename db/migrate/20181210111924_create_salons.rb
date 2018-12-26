class CreateSalons < ActiveRecord::Migration[5.2]
  def change
    create_table :salons , :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
    #create_table :salons do |t|

      t.string :post_code
      t.string :address
      t.string :phone_number
      t.text :menu
      t.string :holiday
      t.string :business_houre

      t.timestamps
    end
  end
end
