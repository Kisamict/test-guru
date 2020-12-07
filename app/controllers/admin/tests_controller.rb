class Admin::TestsController < Admin::BaseController

  before_action :set_test, only: %i[show edit update destroy start]

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
      redirect_to admin_tests_path, notice: "'#{@test.title}' test was updated!"
    else
      render :edit
    end
  end

  def create
    @test = current_user.authored_tests.new(test_params)

    if @test.save
      redirect_to admin_tests_path, notice: "'#{@test.title}' test was created"
    else
      render :new
    end
  end

  def destroy
    if @test.destroy
      redirect_to admin_tests_path
    else
      render plain: 'Woops! Something went wrong'
    end
  end

  def start
    current_user.tests.push(@test)

    redirect_to current_user.test_passage(@test)
  end

  private

  def test_not_found
    render plain: "404: Test not found!"
  end

  def set_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end
end
