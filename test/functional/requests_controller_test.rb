require 'test_helper'

class RequestsControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  test "should get create" do
    get :create
    #assert_response :failure
    String url = "http://test.host/users/sign_in"
    assert_redirected_to url
  end

  test "should get create_curr_location" do
    get :create_curr_location
    assert_response :sign_in
  end

  test "should get create_ride_info" do
    get :create_ride_info
    assert_response :failure
  end

  test "should get delete" do
    get :delete
    assert_response :failure
  end

  test "should get edit" do
    get :edit
    assert_response :failure
  end

  test "should get home" do
    get :home
    assert_response :failure
  end

  test "should get index" do
    get :index
    assert_response :failure
  end

  test "should get sign_in" do
     get :new
     String url = "http://test.host/users/sign_in"
     assert_redirected_to url
 
  end

  test "should get update" do
    get :update
    assert_response :failure
  end

end
