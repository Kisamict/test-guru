class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :test_passages
  has_many :users, through: :test_passages

  def self.by_category(title)
    id = Category.find_by(title: title).id
    Test.where(category_id: id).order('id DESC')
  end
end
