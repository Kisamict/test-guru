class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  helper_method :current_user, 
                :logged_in?


  rescue_from ActiveRecord::RecordNotFound, with: :resource_not_found

  private 

  def resource_not_found
    render plain: '404: Resource not found'
  end 

  def authenticate_user!
    unless current_user
      cookies[:original_path] = request.fullpath
      redirect_to login_path, alert: 'Please login!'
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:id]) if session[:id]
  end

  def logged_in?
    current_user.present?     
  end
end
