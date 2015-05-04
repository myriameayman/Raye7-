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
end