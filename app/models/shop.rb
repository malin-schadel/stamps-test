class Shop < ApplicationRecord
  belongs_to :user
  has_many :stamp_cards
  has_many :opening_hours
  has_many :user_shops
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
