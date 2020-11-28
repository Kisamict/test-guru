class TestsController < ApplicationController
  before_action :set_test, only: %i[show edit update destroy start]
  before_action :set_user, only: %i[start]

  rescue_from ActiveRecord::RecordNotFound, with: :test_not_found

  def index
    @tests = Test.all
  end

  def show
  end

  def new
    @test = Test.new
  end

  def edit
  end

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def create
    @test = Test.new(test_params)

    if @test.save
      redirect_to tests_path
    else
      render :new
    end
  end

  def destroy
    if @test.destroy
      redirect_to tests_path
    else
      render plain: 'Woops! Something went wrong'
    end
  end

  def start
    @user.tests.push(@test)
    
    redirect_to @user.test_passage(@test)
  end

  private

  def test_not_found
    render plain: "404: Test not found!"
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def set_test
    @test = Test.find(params[:id])
  end

  def set_user
    @user = User.first
  end
end
