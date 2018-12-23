class ChatMessage < ApplicationRecord
  belongs_to :user_chat

   validates :content, presence: true, length: { in: 1..200 }
  
end
