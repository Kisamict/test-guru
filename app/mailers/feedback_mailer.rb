class FeedbackMailer < ApplicationMailer 
  def send_feedback(user, feedback_params)
    @admin = Admin.first
    @email = user.email
    @body = feedback_params[:body]

    mail to: @admin.email, subject: "Письмо от пользователя"
  end
end
