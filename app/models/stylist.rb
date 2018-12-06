class Stylist < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
  has_many :user_chats, dependent: :destroy
  has_many :chat_messages, dependent: :destroy
  attachment :stylist_image

  enum sex: {man: 1, woman: 2 }
end
