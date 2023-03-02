class Shop < ApplicationRecord
  belongs_to :user
  has_many :stamp_cards
  has_many :opening_hours
  has_many :user_shops
end
