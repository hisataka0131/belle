class Post < ApplicationRecord
	attachment :post_image

    belongs_to :stylist
    has_many :favorites
    has_many :users, through: :favorites


    enum category: { men: 0, short: 1, medium: 2, long: 3 }

    scope :get_by_category, ->(category) {
    	where(category: category)
    }


    def favorited_by?(user)
          favorites.where(user_id: user.id).exists?
        end
end
