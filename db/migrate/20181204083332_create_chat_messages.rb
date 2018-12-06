class CreateChatMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :chat_messages do |t|
      t.references :user_chat, foreign_key: true
      t.text :content
      t.boolean :stylist, default: true

      t.timestamps
    end
  end
end
