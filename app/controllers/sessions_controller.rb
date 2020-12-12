class SessionsController < ApplicationController
  
  skip_before_action :authenticate_user!

  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    
    if @user&.authenticate(params[:password])
      session[:id] = @user.id
      redirect_to cookies[:original_path] || tests_path
    else
      flash.now[:alert] = "Wrong email or password!"
      render :new
    end
  end

  def destroy 
    reset_session
    render :new
  end
end
