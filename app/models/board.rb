class Board < ApplicationRecord
	belongs_to :stylist
	has_many :board_comments, dependent: :destroy

end
