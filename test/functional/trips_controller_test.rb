require 'test_helper'

class TripsControllerTest < ActionController::TestCase
 include Devise::TestHelpers

    test "should join a trip with seats greater than 0" do
        @user = User.new(:email => 'test2@example.com',:username => 'adel', :password => 'password',
        :password_confirmation => 'password', :firstName => 'Aaaaaadsa', :lastName => 'aasdasdsad')
        @user.save
        sign_in @user
        @myrequest=Request.new(:seats=>1,:long_curr=>4,:lat_curr=>4,:long_destination=>4,:lat_destination=>5,:car_color=>"rouge",
      :car_number=>"34",:user_id=>@user.id)
        @myrequest.save
        @mytrip=Trip.new(:user_id => @user.id,:request_id=> @myrequest.id)
        @mytrip.save
        get :create
        assert :success 
    end 

    test "shouldnot join a trip with seats less than 1" do
        @user =User.new(:email =>'test2@example.com',:username => 'adel', :password => 'password',
        :password_confirmation => 'password', :firstName => 'Aaaaaadsa', :lastName => 'aasdasdsad')
        @user.save
        sign_in @user
        @myrequest=Request.new(:seats=>0,:long_curr=>4,:lat_curr=>4,:long_destination=>4,:lat_destination=>5,:car_color=>"rouge",
          :car_number=>"34",:user_id=>@user.id)
        @myrequest.save
        @mytrip=Trip.new(:user_id => @user.id,:request_id=> @myrequest.id)
        get :create
        assert :failure 
    end

    test "points initial value" do
        @user1 =User.new(:email =>'test1@example.com',:username => 'adel', :password => 'password',
        :password_confirmation => 'password', :firstName => 'Aaaaaadsa', :lastName => 'aasdasdsad')
        @user1.save
        @user2 =User.new(:email =>'test2@example.com',:username => 'renad', :password => 'password',
        :password_confirmation => 'password', :firstName => 'addddaaa', :lastName => 'aasdasdsad')
        @user2.save
        sign_in @user1
        assert_equal 1000 ,@user1.budget,"values are not the same"
    end

    test "no points (budget) left for user" do
        @user1 =User.new(:email =>'test1@example.com',:username => 'adel', :password => 'password',
        :password_confirmation => 'password', :firstName => 'Aaaaaadsa', :lastName => 'aasdasdsad')
        @user1.save
        @user2 =User.new(:email =>'test2@example.com',:username => 'renad', :password => 'password',
        :password_confirmation => 'password',:budget => 0, :firstName => 'addddaaa', :lastName => 'aasdasdsad')
        @user2.save
        sign_in @user1
        @myrequest = Request.new(:seats=>2,:long_curr=>0.305964923E2,:lat_curr=>0.322714587E2,:long_destination=>0.299668343E2,:lat_destination=>0.325498069E2,:car_color=>"rouge",
        :car_number=>"34",:distance => "66",:user_id=>@user1.id)
        @myrequest.save
        sign_in @user2
        @mytrip=Trip.new(:user_id => @user2.id,:request_id=> @myrequest.id)
        @mytrip.save
        get :create
        assert :failure
    end

end