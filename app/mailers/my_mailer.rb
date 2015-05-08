class MyMailer < ActionMailer::Base
  # The source of the email @ebrahim-elgaml @ebrahim-elgaml.
  default from: "raye7.egypt@gmail.com"
  
  # Action to send verification  email on sign up @ebrahim-elgaml .
  # @myUser is the current user to send the verification email @ebrahim-elgaml.
  def gmail_email(user)
    @myUser = user
    unless(@myUser.email == 'ahmedadelibrahim1994@gmail.com')
      mail(from:'raye7.egypt@gmail.com',to: @myUser.email, subject: 'Confirmation Email')
    end
  end

  # Action to send verification  email on adding email @ebrahim-elgaml.
  # @myUser is the current user @ebrahim-elgaml.
  # @grant is the destination email @ebrahim-elgaml.
  def add_email(user,mail)
    @myUser = user
    @grant = mail
    mail(from:'raye7.egypt@gmail.com',to: @grant, subject: 'Confirmation to add Email [Raye7]')
  end

  # Action to send  email on filling feedback form to the webmaster @ebrahim-elgaml.
  # @myUser is the current user @ebrahim-elgaml.
  # @title is the title of the feedback @ebrahim-elgaml.
  # @body is the body of the feedback @ebrahim-elgaml.
  def send_feedback(user,title,message)
    @myUser = user
    @title = title
    @message = message
    unless(@myUser.email == 'ahmedadelibrahim1994@gmail.com')
      mail(from:'raye7.egypt@gmail.com',to: 'ebrahim.el.gaml@gmail.com', subject: 'feedback')
    end
  end

  # Action to send  email on filling feedback form to the user @ebrahim-elgaml.
  # @myUser is the current user @ebrahim-elgaml.
  # @title is the title of the feedback @ebrahim-elgaml.
  # @body is the body of the feedback @ebrahim-elgaml.
  def send_feedback_to_user(user,title,message)
    @myUser = user
    @title = title
    @message = message
    mail(from:'raye7.egypt@gmail.com',to: @myUser.email, subject: 'feedback')
    #mail(from:'raye7.egypt@gmail.com',to: @myUser.email, subject: 'feedback')
  end

  def sample_email(user)
    mail(to:'raye7.egypt@gmail.com', subject: 'Confirmation Email')
  end
  
end