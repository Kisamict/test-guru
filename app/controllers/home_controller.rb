class HomeController < ApplicationController
  def feedback
    if FeedbackMailer.send_feedback(current_user, feedback_params).deliver
      redirect_to root_path, notice: "Отослано"
    else
      redirect_to root_path, notice: "Произошла ошибка"
    end
  end

  private 

  def feedback_params
    params[:feedback].permit(:body)
  end
end
