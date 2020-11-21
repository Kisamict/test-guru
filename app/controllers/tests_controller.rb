class TestsController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :test_not_found

  def index
    render plain: Test.all.inspect
  end

  def show
    render plain: Test.find(params[:id]).inspect
  end

  private

  def test_not_found
    render plain: "404: Test not found!"
  end
end
