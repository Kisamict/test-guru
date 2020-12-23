class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show result update gist]
  before_action :test_questions, only: %i[show update]

  def show
  end

  def result
  end

  def update
    @test_passage.accept!(params[:testpassage][:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    response = GistQuestionService.new(@test_passage.current_question).call

    flash_option = if response.success? 
      { notice: "Test was saved into gist repository" }
    else
      { alert: "Something went wrong!" }
    end

    redirect_to @test_passage, flash_option
  end

  private 

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def test_questions 
    @test_questions = @test_passage.test.questions
  end
end
