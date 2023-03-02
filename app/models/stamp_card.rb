class StampCard < ApplicationRecord
  belongs_to :shop
  has_many :user_cards
end
