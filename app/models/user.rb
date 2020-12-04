class User < ApplicationRecord
  has_many :user_items
  self.primary_key = "user_id"
  validates :username, presence: true
  validates :user_id, presence: true
  validates :password, presence: true
  validates :role, presence: true
end
