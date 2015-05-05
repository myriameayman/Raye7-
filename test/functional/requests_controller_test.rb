require 'test_helper'

class RequestsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  test "should get create" do
    @user = User.new(:email => 'test1@example.com',:username => 'myriame', :password => 'password',
    :password_confirmation => 'password', :firstName => 'Aaaaaadsa', :lastName => 'aasdasdsad')
    @user.save
    sign_in @user
    get :create
    assert :success 
  end
  
  
  test "should get userProfile" do
    @user = User.new(:email => 'test1@example.com',:username => 'myriame', :password => 'password',
    :password_confirmation => 'password', :firstName => 'Aaaaaadsa', :lastName => 'aasdasdsad')
    @user.save
    sign_in @user
    get :create_ride_info
    String url = "http://test.host/"
    assert_redirected_to url 
  end

  
  test "check requests validations not blank" do
    request = Request.new :seats => 5, :car_color => "rouge", :long_destination => 5,:lat_destination => 5, 
    :long_curr => 4,:lat_curr => 4       
    assert !request.valid?
  end
  
  
  test "check requests validations integers only" do
    request = Request.new :seats => "a", :car_color => "rouge", :long_destination => 5,:lat_destination => 5, 
    :long_curr => 4,:lat_curr => 4, :car_number => "28-2180", :air_conditioner => 1, :smoking => 1, :trunk => 0,
    :user_id => 1   
    assert !request.valid?
  end
  
  
  test "check requests validations strings only" do
    request = Request.new :seats => 5, :car_color => "rouge5", :long_destination => 5,:lat_destination => 5, 
    :long_curr => 4,:lat_curr => 4, :car_number => "28-2180", :air_conditioner => 1, :smoking => 1, :trunk => 0   
    assert !request.valid?
  end
  
  
  test "should get home" do
   @user = User.new(:email => 'renad@example.com',:username => 'renad', :password => 'password',
    :password_confirmation => 'password', :firstName => 'Aaaaaadsa', :lastName => 'aasdasdsad')
   @user.save
   sign_in @user
   get :new 
   String url = "http://test.host/home"
   assert_redirected_to url 
  end
  
  
  test "should get myProfile" do
    @user = User.new(:email => 'test1@example.com',:username => 'myriame', :password => 'password',
    :password_confirmation => 'password', :firstName => 'Aaaaaadsa', :lastName => 'aasdasdsad')
    @user.save
    sign_in @user
    @@form_step = nil 
    get :home 
    String url = "http://test.host/"
    assert_redirected_to url 
  end
  
  
  test "should get home2" do
    @user = User.new(:email => 'test1@example.com',:username => 'myriame', :password => 'password',
    :password_confirmation => 'password', :firstName => 'Aaaaaadsa', :lastName => 'aasdasdsad')
    @user.save
    sign_in @user
    @@form_step = 1 
    get :create_curr_location
    String url = "http://test.host/home"
    assert_redirected_to url 
  end
  
  
  test "should get create2" do
    @user = User.new(:email => 'test1@example.com',:username => 'myriame', :password => 'password',
    :password_confirmation => 'password', :firstName => 'Aaaaaadsa', :lastName => 'aasdasdsad')
    @user.save
    sign_in @user
    @@form_step = 2 
    @@request = Request.new
    get :create_curr_location
    String url = "http://test.host/requests/create"
    assert_redirected_to url 
  end
  test "should show request" do
    @user =User.new(:email =>'test2@example.com',:username => 'adel', :password => 'password',
    :password_confirmation => 'password', :firstName => 'Aaaaaadsa', :lastName => 'aasdasdsad')
    @user.save
    sign_in @user
    @myrequest=Request.new(:seats=>1,:long_curr=>4,:lat_curr=>4,:long_destination=>4,:lat_destination=>5,:car_color=>"rouge",
      :car_number=>"34",:user_id=>@user.id)
    @myrequest.save
    get :show, :id => @myrequest.id
    assert_response :success
  end

end