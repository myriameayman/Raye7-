require 'test_helper'

class CirclesControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  #test "should get index" do
   # @user = User.where("id = '1'")
   # session[:user_id] = @user.id
   # get :index
   # assert_response :success
  #end
  
  #before_filter :do_not_authenticate

  #test "should get show" do
    #@user = User.where("id = '1'")
    #session[:user_id] = @user.id
   # get :show
   # assert_response :success
  #end

  test "should get show circle" do
    @user = User.new(:email => 'test@example.com',:username => 'test', 
      :password => 'password', :password_confirmation => 'password', :firstName => 'test',
       :lastName => 'test') 
    @circle = Circle.new 
    @circle.name = "facebook"
    @circle.id = 1
    @circle.user_id = @user.id 
    @circle.save
    @user.circles << @circle
    @user.save
    sign_in @user
    get(:show, {'id' => "1"})
    assert :sucess
    #get(:show, {'id' => "5"})
    #assert_not_nil( :circle, ["the circle is nil"] )
   #assert_response :success
  end
  
  test "should not get show circle" do
    @user = User.new(:email => 'test@example.com',:username => 'test', 
      :password => 'password', :password_confirmation => 'password', :firstName => 'test',
       :lastName => 'test') 
    @circle = Circle.new 
    @circle.name = "facebook"
    @circle.id = 1
    @circle.user_id = @user.id 
    @circle.save
    @user.circles << @circle
    @user.save
    sign_in @user
    get(:show, {'id' => "2"})
    assert_redirected_to "http://test.host/"
  end


  #test "should get show out of range" do
    #@user = User.where("id = '1'")
    #session[:user_id] = @user.id
    #get(:show, {'id' => "500000"})
   # assert_response :success
  #end

  #test "should get create" do
   # @user = User.where("id = '1'")
   # session[:user_id] = @user.id
   # get :create
  #  assert_response :success
 # end

  #test "should get delete" do
    #@user = User.where("id = '1'")
    #session[:user_id] = @user.id
    #get :delete
   # assert_response :success
  #end
  

end
