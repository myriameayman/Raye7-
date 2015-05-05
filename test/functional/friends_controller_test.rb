require 'test_helper'

class FriendsControllerTest < ActionController::TestCase
	include Devise::TestHelpers

  test "should redirect to friends page" do
    @user = User.new(:email => 'test1@example.com',:username => 'myriame', :password => 'password',
    :password_confirmation => 'password', :firstName => 'Aaaaaadsa', :lastName => 'aasdasdsad')
    @user.save
    sign_in @user
    get "index"
    assert_response :success
    String url = "http://test.host/friends/index"
    assert :success
  end
	
end
