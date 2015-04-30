class ExampleMailer < ActionMailer::Base
  default from: "ebrahim.el.gaml@gmail.com"

  def sample_email(user)
    @user = user
    mail(to: @user.email, subject: 'Sample Email')
  end
end