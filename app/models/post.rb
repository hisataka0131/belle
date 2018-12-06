class Post < ApplicationRecord
	attachment :post_image

    belongs_to :stylist
end
