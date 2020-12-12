class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_answers_amount, on: :create

  scope :correct, -> { where(correct: true) }

  private

  def validate_answers_amount
    errors.add(:question, "can't have more than 4 answers") if question.answers.count >= 4
  end
end
