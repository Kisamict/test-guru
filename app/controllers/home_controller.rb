class HomeController < ApplicationController
  def feedback
    if FeedbackMailer.send_feedback(current_user, feedback_params).deliver
      redirect_to root_path, notice: I18n.t("pages.feedback.sent")
    else
      redirect_to root_path, alert: I18n.t("pages.feedback.error")
    end
  end

  private 

  def feedback_params
    params[:feedback].permit(:body)
  end
end
