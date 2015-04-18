require 'test_helper'

class FacebookControllerTest < ActionController::TestCase
	include Devise::TestHelpers

  #test "should get create a user and insert in the DB facebook attributes name , fb_email , provider ,user_id ,auth_token,facebook_profileimage" do
    #@user = User.new(:email => 'test@example.com',:username => 'testusername', :password => 'testpassword',
    #:password_confirmation => 'testpassword', :firstName => 'test', :lastName => 'test',:fb_email=> 'ahmedadelana@hotmail.com',:name=> 'Ahmed Adel',:faceboook_profileimage=>'env["omniauth.auth"].info.image')
    #@user.save
    #sign_in @user
    #get :create
    #assert :success 
  #end
    test "check validations facebookMail not blank" do
    user = User.new :faceboook_profileimage => nil,:email => 'test@example.com',:username => 'testusername', :password => 'testpassword',
    :password_confirmation => 'testpassword', :firstName => 'test', :lastName => 'test',:fb_email=> nil,:name=> 'Ahmed Adel'
    
    assert !user.valid?
  end

     test "check validations facebookProfileimage not blank" do
    user = User.new :faceboook_profileimage => nil,:email => 'test@example.com',:username => 'testusername', :password => 'testpassword',
    :password_confirmation => 'testpassword', :firstName => 'test', :lastName => 'test',:fb_email=> nil,:name=> 'Ahmed Adel'
    
    assert !user.valid?
  end

  test "check validations uid not blank" do
    user = User.new :faceboook_profileimage => nil,:email => 'test@example.com',:username => 'testusername', :password => 'testpassword',
    :password_confirmation => 'testpassword', :firstName => 'test', :lastName => 'test',:fb_email=> nil,:name=> 'Ahmed Adel',:uid=>nil
    
    assert !user.valid?
  end



end
