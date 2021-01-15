class Badge < ApplicationRecord
  enum awarding_rule: { completed_category: 0, with_first_attempt: 1, completed_level: 2 }.freeze

  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :title, uniqueness: true
  validates :title, presence: true
  validates :image_url, presence: true
end
