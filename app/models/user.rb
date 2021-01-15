class User < ApplicationRecord 
  devise :database_authenticatable,
         :registerable,
         :recoverable, 
         :rememberable, 
         :validatable,
         :confirmable

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :authored_tests, class_name: 'Test', foreign_key: 'author_id'
  has_many :gists
  has_many :badges, through: :user_badges
  has_many :user_badges, dependent: :destroy

  scope :completed_tests, -> { test_passages.map(&:completed?) }

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
