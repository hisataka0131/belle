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
  has_many :post_comments, dependent: :destroy


  attachment :user_image

  validates :user_name, presence: true, length: { in: 1..20 }
  validates :user_age, presence: true, length: { in: 1..20 }
  validates :email, presence: true, length: { in: 1..30 }
  validates :user_region,    length: { maximum: 20 }
  validates :user_hobby,    length: { maximum: 50 }
  validates :user_introduction,    length: { maximum: 500 }



end
