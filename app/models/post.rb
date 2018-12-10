class Post < ApplicationRecord
	attachment :post_image

    belongs_to :stylist
    has_many :favorites
    has_many :users, through: :favorites


    def favorited_by?(user)
          favorites.where(user_id: user.id).exists?
        end
end
