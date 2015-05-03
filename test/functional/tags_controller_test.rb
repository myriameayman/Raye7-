require 'test_helper'

class TagsControllerTest < ActionController::TestCase
	include Devise::TestHelpers
test "should get create tag" do #ele 3amel el request
   	@user1 = User.new 
   	@user1.email = 'test1@example.com'
   	@user1.username = 'myriame'
   	@user1.password = 'password'
   	@user1.password_confirmation = 'password'
   	@user1.firstName = 'aaaaaaad'
   	@user1.lastName = 'aaaaaaaaaaaa'
   	@user1.id = 1 
    @user1.save
    sign_in @user1
    
    @user2 = User.new 
   	@user2.email = 'test2@example.com'
   	@user2.username = 'myriame1'
   	@user2.password = 'password'
   	@user2.password_confirmation = 'password'
   	@user2.firstName = 'aaaaaaad'
   	@user2.lastName = 'aaaaaaaaaaaa'
   	@user2.id = 2
    @user2.save
    sign_in @user2  	
    @myrequest=Request.new(:seats=>2,:long_curr=>43,:lat_curr=>4,:long_destination=>4,
      :lat_destination=>5,:car_color=>"rouge",
      :car_number=>"34",:user_id=>1)
    @myrequest.save
    
    @mytag=Tag.new(:user_id => @user2.id,:request_id=>1, :current_user => @user1.id)
    @mytag.save

        get :create
        assert :success

  end
end