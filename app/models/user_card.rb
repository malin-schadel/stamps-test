class UserCard < ApplicationRecord
  belongs_to :user
  belongs_to :stamp_card
end
