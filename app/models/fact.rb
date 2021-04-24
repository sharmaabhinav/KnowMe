class Fact < ApplicationRecord
  validates :fact, presence: true
  scope :active, lambda { |user_id| where(user_id: user_id, active: true) }
  belongs_to :user
end
