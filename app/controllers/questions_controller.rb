class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index new create]
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :resource_not_found

  def index
    render plain: @test.questions.inspect
  end

  def show
  end

  def new
  end

  def create
    question = @test.questions.new(question_params)

    if question.save
      render plain: question.inspect
    else
      render :new
    end
  end

  def destroy
    if @question.destroy
      render plain: "Question ##{@question.id} was deleted"
    else
      render plain: 'Woops! Something went wrong'
    end
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def resource_not_found
    render plain: '404: Resource not found'
  end
end
