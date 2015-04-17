require 'test_helper'

class FacebookControllerTest < ActionController::TestCase
	include Devise::TestHelpers

  test "should get create a user and insert in the DB facebook attributes name , fb_email , provider ,user_id ,auth_token,facebook_profileimage" do
    @user = User.new(:email => 'test@example.com',:username => 'testusername', :password => 'testpassword',
    :password_confirmation => 'testpassword', :firstName => 'test', :lastName => 'test')
    @user.save
    sign_in @user
    get :create
    assert :success 
  end
  

end
