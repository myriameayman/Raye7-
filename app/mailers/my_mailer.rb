class MyMailer < ActionMailer::Base
  # The source of the email @ebrahim-elgaml @ebrahim-elgaml.
  default from: "ebrahim.el.gaml@gmail.com"
  
  # Action to send verification  email on sign up @ebrahim-elgaml .
  # @myUser is the current user to send the verification email @ebrahim-elgaml.
  def gmail_email(user)
  	@myUser = user
    mail(from:'ebrahim.el.gaml@gmail.com',to: @myUser.email, subject: 'Confirmation Email')
  end

  # Action to send verification  email on adding email @ebrahim-elgaml.
  # @myUser is the current user @ebrahim-elgaml.
  # @grant is the destination email @ebrahim-elgaml.
  def add_email(user,mail)
    @myUser = user
    @grant = mail
    mail(from:'ebrahim.el.gaml@gmail.com',to: @grant, subject: 'Confirmation to add Email [Raye7]')
  end

  def sample_email(user)
    mail(to:'ebrahim.el.gaml@gmail.com', subject: 'Confirmation Email')
  end
end