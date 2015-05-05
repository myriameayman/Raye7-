require 'test_helper'

class CirclesControllerTest < ActionController::TestCase

  include Devise::TestHelpers
  test "should get show circle" do
    @user = User.new 
    @user.email = 'test1@example.com'
    @user.username = 'myriame'
    @user.password = 'password'
    @user.password_confirmation = 'password'
    @user.firstName = 'aaaaaaad'
    @user.lastName = 'aaaaaaaaaaaa'
    @user.uid = 1
    @user.id = 1
    @user.fb_email = "hima_2014@hotmail.com"
    @circle = Circle.new
    @circle.id  = 1
    @circle.user_id = 1
    @circle.name = "guc"
    @circle.save
    @email = Email.new
    @email.id = 1
    @email.user_id = 1
    @email.email = "test@guc.com"
    @email.save
    @user.id = 1 
    @user.save
    @user2 = User.new
    @user2.email = 'test2@example.com'
    @user2.username = 'ebrahim'
    @user2.password = 'password'
    @user2.password_confirmation = 'password'
    @user2.firstName = 'ebrahim'
    @user2.lastName = 'elgaml'
    @user2.fb_email = "hima2_2014@hotmail.com"
    @user2.id = 2
    @user2.uid =2
    @user2.faceboook_profileimage = "http://graph.facebook.com/10205640819527369/picture?type=square&width=160&height=160"
    @user2.save
    
    sign_in @user

    get(:show, {'id' => "2"})
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
