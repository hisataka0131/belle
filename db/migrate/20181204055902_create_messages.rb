class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages , :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
    #create_table :messages do |t|

      t.references :stylist, foreign_key: true
      t.references :room, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
