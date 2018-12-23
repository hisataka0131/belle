class Board < ApplicationRecord
	belongs_to :stylist
	has_many :board_comments, dependent: :destroy
	attachment :board_image


	validates :title, presence: true, length: { in: 1..30}
    validates :content, presence: true, length: { in: 1..200 }
    

end
