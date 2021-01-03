class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show result update gist]
  before_action :test_questions, only: %i[show update]

  def show
  end

  def result
  end

  def update
    return redirect_to test_passage_path, alert: I18n.t("controllers.test_passages.update.alert") unless params[:testpassage]

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
  
    flash_option = if response.blank? 
      { alert: t('pages.test_passages.gist.failure') }
    else
      current_user.gists.create(question: @test_passage.current_question, url: response.html_url)
      
      { notice: t('pages.test_passages.gist.success', href: response.html_url) }
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
