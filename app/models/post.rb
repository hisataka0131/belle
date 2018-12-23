class Post < ApplicationRecord
	is_impressionable counter_cache: true
	attachment :post_image

    belongs_to :stylist
    has_many :favorites
    has_many :users, through: :favorites
    has_many :post_comments, dependent: :destroy


    enum category: { men: 0, short: 1, medium: 2, long: 3 }


    validates :post_name, presence: true, length: { in: 1..20 }
    validates :post_opinion, presence: true, length: { in: 1..100 }
    
    


    def favorited_by?(user)
          favorites.where(user_id: user.id).exists?
        end
end
