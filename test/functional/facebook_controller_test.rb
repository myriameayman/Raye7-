require 'test_helper'

class FacebookControllerTest < ActionController::TestCase
	include Devise::TestHelpers

  #test "should get create a user and insert in the DB facebook attributes name , fb_email , provider ,user_id ,auth_token,facebook_profileimage" do
    #@user = User.new(:email => 'test@example.com',:username => 'testusername', :password => 'testpassword',
    #:password_confirmation => 'testpassword', :firstName => 'test', :lastName => 'test',:fb_email=> 'ahmedadelana@hotmail.com',:name=> 'Ahmed Adel',:faceboook_profileimage=>'env["omniauth.auth"].info.image')
    #@user.save
    #sign_in @user
    #get :create
    #assert :success 
  #end
#     test "check validations facebookMail not blank" do
#     user = User.new :faceboook_profileimage => 'http://graph.facebook.com/816246471757866/picture?type=square',:email => 'test@example.com',:username => 'testusername', :password => 'testpassword',
#     :password_confirmation => 'testpassword', :firstName => 'test', :lastName => 'test',:fb_email=> nil,:name=> 'Ahmed Adel',:oauth_token => 'CAAKLNpES24oBAC6o6tE59Q0nHW54a6uyWPxZBmvfS1uvlpZA8qv9XJeUSa5usSAjv6TRlDwHo1sp5j1xZAAh1WjFt3Vai2EQULiyMcEZBS3k1VHBmfXcVVJ6Hd44zYTkPZA0psl8spoqwKQxzEBZAbyGWxlzONLlJFJeAu0GBGrgCRkUkC8xMPmjS6ByfoZBCIptst9ZBnlfZANKQZAgEZCoBcc'
    
#     assert !user.valid?
#   end

#      test "check validations uid not blank" do
#     user = User.new :faceboook_profileimage => 'http://graph.facebook.com/816246471757866/picture?type=square',:email => 'test@example.com',:username => 'testusername', :password => 'testpassword',
#     :password_confirmation => 'testpassword', :firstName => 'test', :lastName => 'test',:fb_email=> 'ahmedadelana@hotmail.com',:name=> 'Ahmed Adel',:oauth_token => 'CAAKLNpES24oBAC6o6tE59Q0nHW54a6uyWPxZBmvfS1uvlpZA8qv9XJeUSa5usSAjv6TRlDwHo1sp5j1xZAAh1WjFt3Vai2EQULiyMcEZBS3k1VHBmfXcVVJ6Hd44zYTkPZA0psl8spoqwKQxzEBZAbyGWxlzONLlJFJeAu0GBGrgCRkUkC8xMPmjS6ByfoZBCIptst9ZBnlfZANKQZAgEZCoBcc',
#     :uid => nil
    
#     assert !user.valid?
#   end

#   test "check validations oauth_token not blank" do
#     user = User.new :faceboook_profileimage => 'http://graph.facebook.com/816246471757866/picture?type=square',:email => 'test@example.com',:username => 'testusername', :password => 'testpassword',
#     :password_confirmation => 'testpassword', :firstName => 'test', :lastName => 'test',:fb_email=> 'ahmedadelana@hotmail.com',:name=> 'Ahmed Adel',:oauth_token => nil,
#     :uid => '816246471757866'
    
#     assert !user.valid?
#   end

#     test "check validations facebookMail is unique" do
#     @user = User.new :faceboook_profileimage => 'http://graph.facebook.com/816246471757866/picture?type=square',:email => 'test@example.com',:username => 'testusername', :password => 'testpassword',
#     :password_confirmation => 'testpassword', :firstName => 'test', :lastName => 'test',:fb_email=> 'ahmedadelana@hotmail.com',:name=> 'Ahmed Adel',:oauth_token => 'CAAKLNpES24oBAC6o6tE59Q0nHW54a6uyWPxZBmvfS1uvlpZA8qv9XJeUSa5usSAjv6TRlDwHo1sp5j1xZAAh1WjFt3Vai2EQULiyMcEZBS3k1VHBmfXcVVJ6Hd44zYTkPZA0psl8spoqwKQxzEBZAbyGWxlzONLlJFJeAu0GBGrgCRkUkC8xMPmjS6ByfoZBCIptst9ZBnlfZANKQZAgEZCoBcc',
#     :uid => '816246471757866'
#     @user.save
    
#     user = User.new :faceboook_profileimage => 'http://graph.facebook.com/633298913480833/picture?type=square',:email => 'test1@example.com',:username => 'testusername1', :password => 'testpassword1',
#     :password_confirmation => 'testpassword1', :firstName => 'test1', :lastName => 'test1',:fb_email=> 'ahmedadelana@hotmail.com',:name=> 'Ahmed Adel',:oauth_token => 'CAAKLNpES24oBAIWw8nirEUgQ8oGbGOJAlMg5tS8CN3VcQcv4jSZCB1LE2q2q6xAhOzPI7QLXOq1vOZAtXN32WXXlbp1ZCEoZBMHNT3K47cdIU86RUJLi2pypORP5bhcwnHFHmCRyGZBPvio1AbSzlhiodjhrOZC91DAQKhZCKTlBkCV1SyjHd55gKKfnpTuuEUZD',
#     :uid => '633298913480833'
    
#     assert !user.valid?
#   end

# test "check validations uid is unique" do
#     @user = User.new :faceboook_profileimage => 'http://graph.facebook.com/816246471757866/picture?type=square',:email => 'test@example.com',:username => 'testusername', :password => 'testpassword',
#     :password_confirmation => 'testpassword', :firstName => 'test', :lastName => 'test',:fb_email=> 'ahmedadelana@hotmail.com',:name=> 'Ahmed Adel',:oauth_token => 'CAAKLNpES24oBAC6o6tE59Q0nHW54a6uyWPxZBmvfS1uvlpZA8qv9XJeUSa5usSAjv6TRlDwHo1sp5j1xZAAh1WjFt3Vai2EQULiyMcEZBS3k1VHBmfXcVVJ6Hd44zYTkPZA0psl8spoqwKQxzEBZAbyGWxlzONLlJFJeAu0GBGrgCRkUkC8xMPmjS6ByfoZBCIptst9ZBnlfZANKQZAgEZCoBcc',
#     :uid => '816246471757866'
#     @user.save
    
#     user = User.new :faceboook_profileimage => 'http://graph.facebook.com/633298913480833/picture?type=square',:email => 'test1@example.com',:username => 'testusername1', :password => 'testpassword1',
#     :password_confirmation => 'testpassword1', :firstName => 'test1', :lastName => 'test1',:fb_email=> 'myriameayman@yahoo.com',:name=> 'Ahmed Adel',:oauth_token => 'CAAKLNpES24oBAIWw8nirEUgQ8oGbGOJAlMg5tS8CN3VcQcv4jSZCB1LE2q2q6xAhOzPI7QLXOq1vOZAtXN32WXXlbp1ZCEoZBMHNT3K47cdIU86RUJLi2pypORP5bhcwnHFHmCRyGZBPvio1AbSzlhiodjhrOZC91DAQKhZCKTlBkCV1SyjHd55gKKfnpTuuEUZD',
#     :uid => '816246471757866'
    
#     assert !user.valid?
#   end

# test "check validations oauth_token is unique" do
#     @user = User.new :faceboook_profileimage => 'http://graph.facebook.com/816246471757866/picture?type=square',:email => 'test@example.com',:username => 'testusername', :password => 'testpassword',
#     :password_confirmation => 'testpassword', :firstName => 'test', :lastName => 'test',:fb_email=> 'ahmedadelana@hotmail.com',:name=> 'Ahmed Adel',:oauth_token => 'CAAKLNpES24oBAC6o6tE59Q0nHW54a6uyWPxZBmvfS1uvlpZA8qv9XJeUSa5usSAjv6TRlDwHo1sp5j1xZAAh1WjFt3Vai2EQULiyMcEZBS3k1VHBmfXcVVJ6Hd44zYTkPZA0psl8spoqwKQxzEBZAbyGWxlzONLlJFJeAu0GBGrgCRkUkC8xMPmjS6ByfoZBCIptst9ZBnlfZANKQZAgEZCoBcc',
#     :uid => '816246471757866'
#     @user.save
    
#     user = User.new :faceboook_profileimage => 'http://graph.facebook.com/633298913480833/picture?type=square',:email => 'test1@example.com',:username => 'testusername1', :password => 'testpassword1',
#     :password_confirmation => 'testpassword1', :firstName => 'test1', :lastName => 'test1',:fb_email=> 'myriameayman@yahoo.com',:name=> 'Ahmed Adel',:oauth_token => 'CAAKLNpES24oBAC6o6tE59Q0nHW54a6uyWPxZBmvfS1uvlpZA8qv9XJeUSa5usSAjv6TRlDwHo1sp5j1xZAAh1WjFt3Vai2EQULiyMcEZBS3k1VHBmfXcVVJ6Hd44zYTkPZA0psl8spoqwKQxzEBZAbyGWxlzONLlJFJeAu0GBGrgCRkUkC8xMPmjS6ByfoZBCIptst9ZBnlfZANKQZAgEZCoBcc',
#     :uid => '633298913480833'
    
#     assert !user.valid?
#   end





end
