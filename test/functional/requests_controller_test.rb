require 'test_helper'

class RequestsControllerTest < ActionController::TestCase

  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get create_curr_location" do
    get :create_curr_location
    assert_response :success
  end

  test "should get create_ride_info" do
    get :create_ride_info
    assert_response :success
  end

  test "should get delete" do
    get :delete
    assert_response :success
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end

  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get update" do
    get :update
    assert_response :success
  end

end
