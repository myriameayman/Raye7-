require 'test_helper'

class PlaceControllerTest < ActionController::TestCase
  test "should get place" do
    get :place
    assert_response :success
  end

end
