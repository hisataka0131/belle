class Stylist < ApplicationRecord

  is_impressionable
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

  validates :stylist_name, presence: true, length: { in: 1..20 }
  validates :salon_name, presence: true, length: { in: 1..20 }
  validates :stylist_age, presence: true, length: { in: 1..20 }
  validates :email, presence: true, length: { in: 1..30 }
  validates :stylist_region,    length: { maximum: 20 }
  validates :stylist_hobby,    length: { maximum: 50 }
  validates :fort,    length: { maximum: 50 } 
  validates :stylist_introduction,    length: { maximum: 500 } 
  validates :phone_number,    length: { maximum: 15 } 
  validates :holiday,    length: { maximum: 30 } 
  validates :business_houre,    length: { maximum: 40 } 
  validates :menu,    length: { maximum: 500 } 
  validates :salon_introduction,    length: { maximum: 500 } 
  validates :salon_url,    length: { maximum: 100 } 










  

  enum sex: {man: 1, woman: 2 }

  def favorited_by?(user)
          follows.where(user_id: user.id).exists?
  end
end
