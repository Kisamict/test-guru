class TestsController < ApplicationController
  before_action :set_test, only: %i[start]

  def index
    @tests = Test.all
  end

  def start
    if @test.questions.empty?
      redirect_to tests_path, alert: I18n.t('pages.tests.index.alert')
    else
      current_user.tests << @test
      redirect_to current_user.test_passage(@test)
    end
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def set_test
    @test = Test.find(params[:id])
  end
end
