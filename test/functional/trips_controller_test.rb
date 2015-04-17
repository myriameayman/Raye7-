require 'test_helper'

class TripsControllerTest < ActionController::TestCase
 include Devise::TestHelpers

	test "should get create trip" do
    	@user = User.new(:email => 'test2@example.com',:username => 'adel', :password => 'password',
    	:password_confirmation => 'password', :firstName => 'Aaaaaadsa', :lastName => 'aasdasdsad')
    	@user.save
    	sign_in @user
    	@myrequest=Request.new(:seats=>1)
    	@myrequest.save
    	@mytrip=Trip.new(:user_id => @user.id,:request_id=> @myrequest.id)
    	@mytrip.save
    	get :create
    	assert :success 
  	end



  
end
