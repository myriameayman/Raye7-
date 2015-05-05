require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  test "should get new page" do
    @user = User.new(:email => 'test@example.com',:username => 'test', 
      :password => 'password', :password_confirmation => 'password', :firstName => 'test',
       :lastName => 'test')
    @user.uid = 1
    @user.faceboook_profileimage = ""
    @user.verification = false 
    @user.save
    sign_in @user
    get :myAccount
    String url = "http://test.host/profiles/new"
    assert_redirected_to url 
    
  end

  test "should get myAccount page" do
    @user = User.new(:email => 'test@example.com',:username => 'test', 
      :password => 'password', :password_confirmation => 'password', :firstName => 'test',
       :lastName => 'test')
    @user.uid = 1
    @user.faceboook_profileimage = ""
    @user.verification = true 
    @user.save
    sign_in @user
    get :myAccount
    assert :success
  end

  test "should not save two same facebook emails" do
    @user1 = User.new(:email => 'test@example.com',:username => 'test', 
      :password => 'password', :password_confirmation => 'password', :firstName => 'test',
       :lastName => 'test')
    @user1.uid = 1
    @user1.fb_email = "hima_2014@hotmail.com"
    @user1.faceboook_profileimage = ""
    @user1.verification = false 
    @user1.save
    @user2 = User.new(:email => 'test2@example.com',:username => 'test2', 
      :password => 'password', :password_confirmation => 'password', :firstName => 'test',
       :lastName => 'test')
    @user2.uid = 1
    @user2.fb_email = "hima_2014@hotmail.com"
    @user2.faceboook_profileimage = ""
    @user2.verification = false 
    assert !@user2.save
  end
  test "should not save two same gmail" do
    @user1 = User.new(:email => 'test@example.com',:username => 'test', 
      :password => 'password', :password_confirmation => 'password', :firstName => 'test',
       :lastName => 'test')
    @user1.uid = 1
    @user1.gmail = "hima_2014@hotmail.com"
    @user1.faceboook_profileimage = ""
    @user1.verification = false 
    @user1.save
    @user2 = User.new(:email => 'test2@example.com',:username => 'test2', 
      :password => 'password', :password_confirmation => 'password', :firstName => 'test',
       :lastName => 'test')
    @user2.uid = 1
    @user2.gmail = "hima_2014@hotmail.com"
    @user2.faceboook_profileimage = ""
    @user2.verification = false 
    assert !@user2.save
  end
    test "should not save two same screen_names" do
    @user1 = User.new(:email => 'test@example.com',:username => 'test', 
      :password => 'password', :password_confirmation => 'password', :firstName => 'test',
       :lastName => 'test')
    @user1.uid = 1
    @user1.screen_name = "hima_2014@hotmail.com"
    @user1.faceboook_profileimage = ""
    @user1.verification = false 
    @user1.save
    @user2 = User.new(:email => 'test2@example.com',:username => 'test2', 
      :password => 'password', :password_confirmation => 'password', :firstName => 'test',
       :lastName => 'test')
    @user2.uid = 1
    @user2.screen_name = "hima_2014@hotmail.com"
    @user2.faceboook_profileimage = ""
    @user2.verification = false 
    assert !@user2.save
  end
  
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
    @user.uid = 1
    @user.fb_email = "hima_2014@hotmail.com"
    @user.id = 1 
    @user.save
    sign_in @user
    sign_in @user
    @friend = User.new
    @friend.email = 'test2@example.com'
    @friend.username = 'ebrahim'
    @friend.password = 'password'
    @friend.password_confirmation = 'password'
    @friend.firstName = 'ebrahim'
    @friend.lastName = 'elgaml'
    @friend.fb_email = "hima2_2014@hotmail.com"
    @friend.id = 2
    @friend.uid =2
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
