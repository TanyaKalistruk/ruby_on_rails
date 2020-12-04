class ProstorItem < ApplicationRecord
  has_many :user_item
  self.primary_key = "item_id"
  validates :item_id, presence: true
  validates :item_name, presence: true
  validates :price, presence: true
end
