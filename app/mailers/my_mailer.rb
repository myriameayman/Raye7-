class MyMailer < ActionMailer::Base
  # The source of the email @ebrahim-elgaml.
  default from: "ebrahim.el.gaml@gmail.com"
  # Action to send the email .
  # @myUser is the current user to send the verification email .
  def gmail_email(user)
  	@myUser = user
    mail(from:'ebrahim.el.gaml@gmail.com',to: @myUser.email, subject: 'Confirmation Email')
  end


  def add_email(user,mail)
    @myUser = user
    @grant = mail
    mail(from:'ebrahim.el.gaml@gmail.com',to: @grant, subject: 'Confirmation to add Email [Raye7]')
  end

  def sample_email(user)
    mail(to:'ebrahim.el.gaml@gmail.com', subject: 'Confirmation Email')
  end
end