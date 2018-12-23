class Message < ApplicationRecord
  belongs_to :stylist
  belongs_to :room

   validates :content, presence: true, length: { in: 1..200 }
    
end
