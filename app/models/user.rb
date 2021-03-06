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

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  # def tests_by_level(level)
    # tests.where(level: level).order('id DESC')
  # end
end
