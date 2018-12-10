class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_chats, dependent: :destroy
  has_many :chat_messages, dependent: :destroy
  has_many :favorites
  has_many :posts, through: :favorites
  has_many :follows, dependent: :destroy
  has_many :stylists, through: :follows


  attachment :user_image


end
