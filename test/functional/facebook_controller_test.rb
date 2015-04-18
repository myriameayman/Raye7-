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

 test "check validations oauth_token not blank" do
    user = User.new :faceboook_profileimage => nil,:email => 'test@example.com',:username => 'testusername', :password => 'testpassword',
    :password_confirmation => 'testpassword', :firstName => 'test', :lastName => 'test',:fb_email=> nil,:name=> 'Ahmed Adel',:uid=>nil,:oauth_token=>nil
    
    assert !user.valid?
  end

  test "check validations facebookMail is unique" do
    user = User.new :faceboook_profileimage => nil,:email => 'test@example.com',:username => 'testusername', :password => 'testpassword',
    :password_confirmation => 'testpassword', :firstName => 'test', :lastName => 'test',:fb_email=> "ahmedadelana@hotmail.com",:name=> 'Ahmed Adel'
    
    assert !user.valid?
  end

  test "check validations facebookOauth-token is unique" do
    user = User.new :faceboook_profileimage => nil,:email => 'test@example.com',:username => 'testusername', :password => 'testpassword',
    :password_confirmation => 'testpassword', :firstName => 'test', :lastName => 'test',:fb_email=> "ahmedadelana@hotmail.com",:name=> 'Ahmed Adel',:oauth_token => 'CAAKLNpES24oBAC6o6tE59Q0nHW54a6uyWPxZBmvfS1uvlpZA8qv9XJeUSa5usSAjv6TRlDwHo1sp5j1xZAAh1WjFt3Vai2EQULiyMcEZBS3k1VHBmfXcVVJ6Hd44
    zYTkPZA0psl8spoqwKQxzEBZAbyGWxlzONLlJFJeAu0GBGrgCRkUkC8xMPmjS6ByfoZBCIptst9ZBnlfZANKQZAgEZCoBcc'
    
    assert !user.valid?
  end

  test "check validations facebook-uid is unique" do
    user = User.new :faceboook_profileimage => nil,:email => 'test@example.com',:username => 'testusername', :password => 'testpassword',
    :password_confirmation => 'testpassword', :firstName => 'test', :lastName => 'test',:fb_email=> "ahmedadelana@hotmail.com",:name=> 'Ahmed Adel',
    :oauth_token => nil , :uid => '816246471757866'
    
    assert !user.valid?
  end






end
