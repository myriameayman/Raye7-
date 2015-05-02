require 'test_helper'

class EmailsControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  
  # Test if the circle will be added after adding email @ebrahim-elgaml.  
  test "should get GUC circle" do
    @user = User.new 
    @user.email = 'test1@example.com'
    @user.username = 'myriame'
    @user.password = 'password'
    @user.password_confirmation = 'password'
    @user.firstName = 'aaaaaaad'
    @user.lastName = 'aaaaaaaaaaaa'
    @user.uid = 1
    @user.fb_email = "hima_2014@hotmail.com"
    @circle = Circle.new
    @circle.id  = 1
    @circle.user_id = 1
    @circle.name = 'guc'
    @email = Email.new
    @email.id = 1
    @email.user_id = 1
    @email.email = "test@guc.com"
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
    sign_in @user2
    String url = "http://test.host/emails/verify?id=2"
    get :verify , :email => "testguc@student.guc.edu.eg"
    assert @user2.circles.exists?(:name => 'guc')
  end


  # Check if the email added to the User @ebraihm-elgaml.
  test "test add email" do
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
    @circle.name = 'guc'
    @email = Email.new
    @email.id = 1
    @email.user_id = 1
    @email.email = "test@guc.com"
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
    sign_in @user2
    get :verify , :email => "testguc@student.guc.edu.eg"
    assert @user2.emails.exists?(:email => "testguc@student.guc.edu.eg")
  end

  # Test if the friend will be added to the circle @ebrahim-elgaml.
  test "should get GUC friend in a circle" do
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
    sign_in @user2
    #String url = "http://test.host/emails/verify?id=2"
    get :verify , :email => "testguc@student.guc.edu.eg"
    @guc_circle = @user2.circles.where("name = 'guc'")
    #@circle = Circle.all
    #friend = Friend.all
    assert @guc_circle[0].friends.exists?(:app_id => @user.id)
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
