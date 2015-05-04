require 'test_helper'

class CirclesControllerTest < ActionController::TestCase

  include Devise::TestHelpers
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

  test "should not get show circle nil" do
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
    get(:show, {'id' => nil})
    assert_redirected_to "http://test.host/"
  end


end
