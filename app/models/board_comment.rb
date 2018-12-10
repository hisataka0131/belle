class BoardComment < ApplicationRecord
	belongs_to :stylist
    belongs_to :board
end
