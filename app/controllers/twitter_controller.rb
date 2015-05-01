class TwitterController < ApplicationController
	before_filter :authenticate_user!

	def index
		unless TwitterOauthSetting.find_by_user_id(current_user.id).nil?
      redirect_to "/twitter_profile"
    end
	end

	def generate_twitter_oauth_url
		oauth_callback = "http://#{request.host}:#{request.port}/oauth_account"

		@consumer = OAuth::Consumer.new("rfoURDvnXa4eKoypFRmJVA","u6Vm5CDHmiOfT7UmJRS7tRJeITQrKXKs7M97in46PGo", :site => "https://api.twitter.com")

  	    @request_token = @consumer.get_request_token(:oauth_callback => oauth_callback)
		session[:request_token] = @request_token

		redirect_to @request_token.authorize_url(:oauth_callback => oauth_callback)
	end


	def oauth_account
		if TwitterOauthSetting.find_by_user_id(current_user.id).nil?
			@request_token = session[:request_token]
			@access_token = @request_token.get_access_token(:oauth_verifier => params["oauth_verifier"])
      TwitterOauthSetting.create(atoken: @access_token.token, asecret: @access_token.secret, user_id: current_user.id)
      update_user_account()
    end
		redirect_to "/twitter_profile"
	end

  def get_client

  client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "rfoURDvnXa4eKoypFRmJVA"
  config.consumer_secret     = "u6Vm5CDHmiOfT7UmJRS7tRJeITQrKXKs7M97in46PGo"
  config.access_token        = TwitterOauthSetting.find_by_user_id(current_user.id).atoken
  config.access_token_secret = TwitterOauthSetting.find_by_user_id(current_user.id).asecret
end
	end

 def twitter_profile
  	
  	#Trip.where(request_id: params[:id])
    #@home_timeline = get_client.home_timeline
    #@user_following = get_client.user_following
    #client = get_client 
    #@user_timeline = client.user_timeline
    #@friends = get_client.friends.each_slice(50)
    #@followers = get_client.followers.each_slice (50)
    @Twitter = Circle.where(user_id:current_user.id).all
      @Twitter.each do |t|
      	if (t.name == "twitter")
      		@SCircle = t.name 
      		@SavedFriends = Friend.where(circle_id:t.id).all
        end    
        
      end
      if (@SCircle == nil)
      	 # @friends = get_client.friends_ids.screen_name
      
         @friends = get_client.friends_ids(screen_name,profile_image_url)
         @followers = get_client.followers_ids(screen_name,profile_image_url)
           begin
              @followers.to_a
                 rescue Twitter::Error::TooManyRequests => error
                    sleep error.rate_limit.reset_in + 1
                  retry

           end
           begin
              @friends.to_a
                 rescue Twitter::Error::TooManyRequests => error
                   sleep error.rate_limit.reset_in + 1
                   retry

            end

    tCircle = Circle.new 
	tCircle.user_id = current_user.id 
	tCircle.name = "twitter"
	tCircle.save 
	     @friends.each do |f|  
	  	   @followers.each do |fo| 
              if(f.screen_name == fo.screen_name)
              	tFriend = Friend.new 
                tFriend.circle_id = tCircle.id   
                tFriend.name = f.screen_name
                tFriend.image = f.profile_image_url 
                tFriend.save
              end  
           end  
         end

        user_twitter_profile = get_client.user
	   # current_user.update_attributes({
	    @Sscreen_name = user_twitter_profile.screen_name 
	    @Surl = user_twitter_profile.url
	    @Sprofile_image_url = user_twitter_profile.profile_image_url 
	    @Slocation = user_twitter_profile.location 
	    @Sdescription = user_twitter_profile.description
	  #})
        @SavedFriends = Friend.where(id:current_user.id ,circle_id: params[:id]).all
	    @SavedUser = User.find_by_id(current_user.id)
        @SavedUser.screen_name = @Sscreen_name
        @SavedUser.url = @Surl
        @SavedUser.profile_image_url = @Sprofile_image_url
        @SavedUser.location = @Slocation
        @SavedUser.description= @Sdescription
        @SavedUser.save

      end 	     
  end
	private

    def get_Friends

       @friends = get_client.friends
       @followers = get_client.followers
         begin
           @followers.to_a
             rescue Twitter::Error::TooManyRequests => error
                sleep error.rate_limit.reset_in + 1
                 retry

         end
         begin
            @friends.to_a
             rescue Twitter::Error::TooManyRequests => error
               sleep error.rate_limit.reset_in + 1
                  retry

                end

      tCircle = Circle.new 
	tCircle.user_id = current_user.id 
	tCircle.name = "twitter"
	tCircle.save 
	     @friends.each do |f|  
	  	   @followers.each do |fo| 
              if(f.screen_name == fo.screen_name)
              	tFriend = Friend.new 
                tFriend.circle_id = tCircle.id   
                tFriend.name = f.screen_name 
                tFriend.save
              end  
           end  
         end



    end
	def update_user_account
	  user_twitter_profile = get_client.user
	  current_user.update_attributes({
	    name: user_twitter_profile.name, 
	    screen_name: user_twitter_profile.screen_name, 
	    url: user_twitter_profile.url, 
	    profile_image_url: user_twitter_profile.profile_image_url, 
	    location: user_twitter_profile.location, 
	    description: user_twitter_profile.description
	  })
	end
	def signout                                             
  if something_is_not_kosher
  redirect_to signout_path and return
end
end
end
