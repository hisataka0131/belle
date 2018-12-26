class CreateUserChats < ActiveRecord::Migration[5.2]
  def change
    create_table :user_chats , :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
    #create_table :user_chats do |t|

      t.references :stylist, foreign_key: true
      t.references :user, foreign_key: true
      t.string :chat_name

      t.timestamps
    end
  end
end
