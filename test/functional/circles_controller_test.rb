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
   
 test "circle must be deleted from user circle and added to blocked circle and same for 
    friends" do
     @user = User.new(:email => 'test@example.com',:username => 'testusername', :password => 'testpassword',
      :password_confirmation => 'testpassword', :firstName => 'test', :lastName => 'test',:fb_email=> 'ahmedadelana@hotmail.com',:name=> 'Ahmed Adel',:faceboook_profileimage=>'env["omniauth.auth"].info.image')
     sign_in @user
     @circle = Circle.new 
     @circle.name = "twitter"
     @circle.id = 2
     @circle.user_id = @user.id 
     @circle.save
     @user.circles << @circle
     @circle.save
     @friend = Blocked.new 
     @friend.circle_id = @circle.id
     @friend.friend_id = @user.id 
     @friend.save
     sign_in @user
     get(:Block_Circle, {'id' => "2"})
     #get (:Block_Circle  ,{'id' => '2'})
     @blocked_circle = BlockedCircle.all
     assert !@blocked_circle[0].nil?
   end
  
end
