require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase

 # test "should get new" do
  #  get :new
   # assert_response :success
  #end
  
  test "should get friend profile" do
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
    @friend = User.new 
    @friend.email = 'test2@example.com'
    @friend.username = 'ebrahim'
    @friend.password = 'password'
    @friend.password_confirmation = 'password'
    @friend.firstName = 'ebrahim'
    @friend.lastName = 'elgaml'
    @friend.id = 2
    @friend.faceboook_profileimage = "http://graph.facebook.com/10205640819527369/picture?type=square&width=160&height=160"
    @friend.save
    String url = "http://test.host/profiles/friend_profile?id=2"
    get(:friend_profile, {'id' => "2"})
    assert :success 
  end

  
  #test "should get create" do
   # get :create
    #assert_response :success
  #end

  #test "should get show" do
   # get :show
    #assert_response :success
  #end
 # test "should get show" do
  #  get :show
  #  assert_not_nil( :user, ["the user is nil"] )
   # assert_response :success
  #end

  #test "should get delete" do
   # get :delete
    #assert_response :success
  #end

  #test "should get index" do
   # get :index
    #assert_response :success
  #end

  #test "should get edit" do
   # get :edit
    #assert_response :success
  #end

end
