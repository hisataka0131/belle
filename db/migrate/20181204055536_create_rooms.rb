class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms  , :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
    	#create_table :rooms do |t|
      t.string :room_name

      t.timestamps
    end
  end
end
