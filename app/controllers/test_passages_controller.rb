class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show result update]
  before_action :test_questions, only: %i[show update]

  def show
  end

  def result
  end

  def update
    @test_passage.accept!(params[:testpassage][:answer_ids])

    if @test_passage.completed?
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private 

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def test_questions 
    @test_questions = @test_passage.test.questions
  end
end