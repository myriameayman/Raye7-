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
  
 # test "should get new" do
  #  get :new
   # assert_response :success
  #end
  

  
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
