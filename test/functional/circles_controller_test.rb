require 'test_helper'

class CirclesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get show in range" do
    get(:show, {'id' => "5"})
    assert_not_nil( :circle, ["the circle is nil"] )
    assert_response :success
  end
  test "should get show out of range" do
    get(:show, {'id' => "500000"})
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get delete" do
    get :delete
    assert_response :success
  end
  

end
