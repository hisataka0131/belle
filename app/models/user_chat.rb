class UserChat < ApplicationRecord
  belongs_to :stylist
  belongs_to :user
  has_many :chat_messages, dependent: :destroy
end
