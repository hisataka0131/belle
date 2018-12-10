class Room < ApplicationRecord

  has_many :messages, dependent: :destroy
  has_many :entries
  has_many :stylists, through: :entries
  # accepts_nested_attributes_for :entries
end
