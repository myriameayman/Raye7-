class FacebookController < ApplicationController
	before_filter :authenticate_user!

  def create
  	@user = current_user
<<<<<<< HEAD
   
    @fb_friends = FbGraph::User.me(env["omniauth.auth"].credentials.token).friends
    @graph = Koala::Facebook::API.new(env["omniauth.auth"].credentials.token)
    profile = @graph.get_object("me")

    friends = @graph.get_connections("me", "friends")
    @user.name = friends.count
=======
>>>>>>> 4ee8616d3e321fe640c56ced20af84c3ec1304c8
  	@user.provider = env["omniauth.auth"].provider
    @user.uid = env["omniauth.auth"].uid
    @user.fb_email = env["omniauth.auth"].info.email
    @user.faceboook_profileimage=env["omniauth.auth"].info.image
    @user.oauth_token = env["omniauth.auth"].credentials.token
<<<<<<< HEAD
    
    #unless(Circle.find_by(name: 'facebook') == nil)
      fbCircle = Circle.new 
      fbCircle.user_id = current_user.id 
      fbCircle.name = "facebook"
      fbCircle.save
    #else
     # fbCircle =  Circle.find_by name: 'facebook'
    #end

    friends.each do |f| 
        fbFriend = Friend.new 
        fbFriend.circle_id = fbCircle.id   
        fbFriend.name = f["name"]
        fbFriend.fb_id = f["id"] 
        fbFriend.save  
    end       

   
    Koala.config.api_version = "v2.0"

=======
>>>>>>> 4ee8616d3e321fe640c56ced20af84c3ec1304c8
    @user.save!
    redirect_to root_path
  end

<<<<<<< HEAD
  

=======
>>>>>>> 4ee8616d3e321fe640c56ced20af84c3ec1304c8
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
