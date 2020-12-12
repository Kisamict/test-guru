class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_locale
  before_action :authenticate_user!

  rescue_from ActiveRecord::RecordNotFound, with: :resource_not_found

  private 

  def resource_not_found
    render plain: '404: Resource not found'
  end 

  def default_url_options
    { lang: I18n.locale == I18n.default_locale ? nil : I18n.locale } 
  end

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end

  def after_sign_in_path_for(resource)
    resource.is_a?(Admin) ? admin_tests_path : root_path
  end
end
