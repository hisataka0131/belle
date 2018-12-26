class CreateFollows < ActiveRecord::Migration[5.2]
  def change
    create_table :follows, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
    #create_table :follows do |t|

      t.integer :stylist_id
      t.integer :user_id

      t.timestamps
    end
  end
end
