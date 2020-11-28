class QuestionsController < ApplicationController
  before_action :set_test, only: %i[index new create]
  before_action :set_question, only: %i[destroy edit update]

  rescue_from ActiveRecord::RecordNotFound, with: :resource_not_found

  def edit
  end

  def update
    @question.update(question_params)
    redirect_to test_path(@question.test)
  end

  def new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to test_path(@test)
    else
      redirect_to new_test_question_path(@test)
    end
  end

  def destroy
    if @question.destroy
      redirect_to test_path(@question.test)
    else
      render plain: 'Woops! Something went wrong'
    end
  end

  private

  def set_test
    @test = Test.find(params[:test_id])
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def resource_not_found
    render plain: '404: Resource not found'
  end
end
