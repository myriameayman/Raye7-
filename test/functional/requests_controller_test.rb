require 'test_helper'

class RequestsControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  

  test "should get create" do
    get :create
    assert :success 
  end
  
  
  test "should get userProfile" do
    get :create_ride_info
    String url = "http://test.host/profiles/myAccount"
    assert_redirected_to url 
  end

  
  test "check requests validations not blank" do
    request = Request.new :seats => 5, :car_color => "rouge", :long_destination => 5,:lat_destination => 5, 
    :long_curr => 4,:lat_curr => 4       
    assert !request.valid?
  end
  
  
  test "check requests validations integers only" do
    request = Request.new :seats => "a", :car_color => "rouge", :long_destination => 5,:lat_destination => 5, 
    :long_curr => 4,:lat_curr => 4, :car_number => "28-2180", :air_conditioner => 1, :smoking => 1, :trunk => 0   
    assert !request.valid?
  end
  
  
  test "check requests validations strings only" do
    request = Request.new :seats => 5, :car_color => "rouge5", :long_destination => 5,:lat_destination => 5, 
    :long_curr => 4,:lat_curr => 4, :car_number => "28-2180", :air_conditioner => 1, :smoking => 1, :trunk => 0   
    assert !request.valid?
  end
  
  
  test "should get home" do
    get :new 
    String url = "http://test.host/home"
    assert_redirected_to url 
  end
  
  
  test "should get myProfile" do
    @@i = nil 
    get :home 
    String url = "http://test.host/profiles/myAccount"
    assert_redirected_to url 
  end
  
  
  test "should get home2" do
    @@i = 1 
    get :create_curr_location
    String url = "http://test.host/home"
    assert_redirected_to url 
  end
  
  
  test "should get create2" do
    @@i = 2 
    @@request = Request.new
    get :create_curr_location
    String url = "http://test.host/requests/create"
    assert_redirected_to url 
  end

end
