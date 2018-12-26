class CreateBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :boards, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC'  do |t|
    #create_table :boards do |t|

      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
