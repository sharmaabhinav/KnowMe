class User < ApplicationRecord
  validates :username, presence: true
  validates :password, presence: true
  scope :active, lambda { where(active: true) }
  has_many :facts
end
