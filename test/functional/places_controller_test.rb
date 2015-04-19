require 'test_helper'

class PlacesControllerTest < ActionController::TestCase
   test "should get create" do
   	@user = User.new 
   	@user.email = 'test1@example.com'
   	@user.username = 'myriame'
   	@user.password = 'password'
   	@user.password_confirmation = 'password'
   	@user.firstName = 'aaaaaaad'
   	@user.lastName = 'aaaaaaaaaaaa'
   	@user.id = 1 
    @user.save
    sign_in @user
    @place = Place.new 
    @place.name = "madenty"
    @place.id = 1 
   	@place.save
    @visit = Visit.new 
    @visit.user_id = @user.id 
    @visit.place_id = @place.id
    @visit.save   
    get :create
    assert :success 
  end
   test "should get show" do
   	@user = User.new 
   	@user.email = 'test1@example.com'
   	@user.username = 'myriame'
   	@user.password = 'password'
   	@user.password_confirmation = 'password'
   	@user.firstName = 'aaaaaaad'
   	@user.lastName = 'aaaaaaaaaaaa'
   	@user.id = 1 
    @user.save
    sign_in @user
    @place = Place.new 
    @place.name = "madenty"
    @place.id = 1 
   	@place.save
    @visit = Visit.new 
    @visit.user_id = @user.id 
    @visit.place_id = @place.id
    @visit.save   
    get(:show, {'id' => "1"})
    assert :success 
  end
   test "should not get show" do
   	@user = User.new 
   	@user.email = 'test1@example.com'
   	@user.username = 'myriame'
   	@user.password = 'password'
   	@user.password_confirmation = 'password'
   	@user.firstName = 'aaaaaaad'
   	@user.lastName = 'aaaaaaaaaaaa'
   	@user.id = 1 
    @user.save
    sign_in @user
    @place = Place.new 
    @place.name = "madenty"
    @place.id = 2 
   	@place.save
    @visit = Visit.new 
    @visit.user_id = @user.id 
    @visit.place_id = @place.id
    @visit.save   
    get(:show, {'id' => "1"})
    assert_redirected_to "http://test.host/"
  end
end
