class Stylist < ApplicationRecord

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :boards, dependent: :destroy
  
  has_many :entries, dependent: :destroy
  has_many :rooms, through: :entries, dependent: :destroy

  has_many :user_chats, dependent: :destroy
  has_many :chat_messages, dependent: :destroy
  has_many :follows, dependent: :destroy
  has_many :user, through: :follows
  has_many :boards, dependent: :destroy
  has_many :board_comments, dependent: :destroy
  has_one :salon, dependent: :destroy

  attachment :stylist_image
  attachment :salon_image

  

  enum sex: {man: 1, woman: 2 }

  def favorited_by?(user)
          follows.where(user_id: user.id).exists?
  end
end
