require 'test_helper'

class FacebookControllerTest < ActionController::TestCase
	include Devise::TestHelpers

#  test "should get create a user and insert in the DB facebook attributes name , fb_email , provider ,user_id ,auth_token,facebook_profileimage" do
#    @user = User.new(:email => 'test@example.com',:username => 'testusername', :password => 'testpassword',
#    :password_confirmation => 'testpassword', :firstName => 'test', :lastName => 'test',:fb_email=> 'ahmedadelana@hotmail.com',:name=> 'Ahmed Adel',:faceboook_profileimage=>'env["omniauth.auth"].info.image')
#     @user.save
#     sign_in @user
#     @circle = Circle.new (:name => 'twitter', :user_id => @user.id)
#     @circle.save
#     @friend = Friend.new (:user_id => @user.id,:circle_id => @circle.id)
#     @friend.save
#     get :create
#     assert :success 

#  end


end
