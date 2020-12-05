class TestsController < ApplicationController

  before_action :set_test, only: %i[show start]

  def index
    @tests = Test.all
  end

  def start
    @user.tests << @test
    
    redirect_to current_user.test_passage(@test)
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def set_test
    @test = Test.find(params[:id])
  end
end
