class BoardComment < ApplicationRecord
	belongs_to :stylist
    belongs_to :board


    validates :comment, presence: true, length: { in: 1..500}
    
end
