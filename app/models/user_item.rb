class UserItem < ApplicationRecord
  belongs_to :prostor_item
  belongs_to :user
  validates :count, presence: true
end
