class MyMailer < ActionMailer::Base
  default from: "ebrahim.el.gaml@gmail.com"
  def gmail_email(user)
  	@myUser = user
    #subject    'my Email'
    #recipients  'ebrahim.el.gaml@gmail.com'
    #from 		'ebrahim.el.gaml@gmail.com'
    #sent_on		Time.now
    mail(from:'ebrahim.el.gaml@gmail.com',to: @myUser.email, subject: 'Confirmation Email')
    #@user = user
    #mail(to: @user.email, subject: 'Sample Email')
  end

  def sample_email(user)
    #subject   ' my Email'
    #recipients  'ebrahim.el.gaml@gmail.com'
    #from 		'ebrahim.el.gaml@gmail.com'
    #sent_on		Time.now
    #@user = user
    mail(to:'ebrahim.el.gaml@gmail.com', subject: 'Confirmation Email')
  end
end