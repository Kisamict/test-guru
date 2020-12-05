class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  before_action :authenticate_user!

  rescue_from ActiveRecord::RecordNotFound, with: :resource_not_found

  private 

  def resource_not_found
    render plain: '404: Resource not found'
  end 
end
