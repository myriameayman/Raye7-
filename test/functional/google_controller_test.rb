require 'test_helper'

class RequestsControllerTest < ActionController::TestCase
  include Devise::TestHelpers
 test "should get the user's gmail and save in the database" do
    @user =User.new(:email =>'test2@example.com',:username => 'adel', :password => 'password',
    :password_confirmation => 'password', :firstName => 'Ahmed', :lastName => 'Adel')
    @user.save
    sign_in @user
    String url = "http://test.host/auth/google_oauth2/callback"
    assert_response :success
    end

end