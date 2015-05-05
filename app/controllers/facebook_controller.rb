class FacebookController < ApplicationController


# Checks that there is a currently authunticated user. 
  before_filter :authenticate_user!
# Add Facebook attributes to a user who is signing up to RAYE7 after redirecting him to facebook auth page.
# The variables : @user => current user , @fb_friends => get tokens of user facebook friends.  
                # @graph => token of the user profile , profile => current user profile.
                # friends => list of the user facebook friends , @user.name => facebook name of the user.
                # @user.provider => "facebook" , @user.id => facebook user id.
                # @user.fb_email => user's facebook email , @user.facebook_profileimage => url for user's facebook profile image.
                # @user.oauth_token => the user's facebook oauthuntication token.

                # @user.gender => the user's facebook gender[ male or femal ].
   def create

    @user = current_user
    @fb_friends = FbGraph::User.me(env["omniauth.auth"].credentials.token).friends
    @graph = Koala::Facebook::API.new(env["omniauth.auth"].credentials.token)
    profile = @graph.get_object("me")
    friends = @graph.get_connections("me", "friends")
    @user.name = env["omniauth.auth"].info.name
    @user.provider = env["omniauth.auth"].provider
    @user.uid = env["omniauth.auth"].uid
    @user.fb_email = env["omniauth.auth"].info.email

    @user.gender = env["omniauth.auth"].extra.raw_info.gender
    @user.faceboook_profileimage=env["omniauth.auth"].info.image
    @user.oauth_token = env["omniauth.auth"].credentials.token
 
    # Check that circles if the facebook circles already exists and if not create a new one.
    # The variables :fbCircle => facebook circle.              
   
    unless(@user.circles.exists?(:name => "facebook"))
          fbCircle = Circle.new 
          fbCircle.user_id = current_user.id 
          fbCircle.name = "facebook"
          fbCircle.save
 
    else
          fbCircle = @user.circles.where("name = 'facebook'")
    end

# Insert a list of friends in the facebook circles.
# The variables : fbFriend.
    friends.each do |f| 
        fbFriend = Friend.new 
        fbFriend.circle_id = fbCircle.id   
        fbFriend.name = f["name"]
        fbFriend.fb_id = f["id"] 
        fbFriend.save  
    end   
        friendUser = User.find(:all, :conditions => ['uid LIKE ?' , f["id"]])
        #fUser = nil
        friendUser.each do |u|
          fbFriend.app_id = u.id
        end
        #fbFriend.app_id = fUser.user_id
        fbFriend.fb_id = f["id"]
        fbFriend.save  
    end

    # Save the user info in the database.    
    
    Koala.config.api_version = "v2.0"
    @user.save!
    redirect_to root_path
  end

  
# Destroy a session opened.
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
