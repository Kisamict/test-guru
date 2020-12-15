class Admin::QuestionsController < Admin::BaseController
  before_action :set_test, only: %i[new create]
  before_action :set_question, only: %i[destroy edit update show]
  
  def edit
  end

  def update
    @question.update(question_params)
    redirect_to admin_test_path(@question.test)
  end

  def new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to admin_test_path(@test)
    else
      redirect_to new_admin_test_question_path(@test)
    end
  end

  def destroy
    if @question.destroy
      redirect_to admin_test_path(@question.test)
    else
      redirect_to admin_test_path, alert: 'Something went wrong'
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
end
