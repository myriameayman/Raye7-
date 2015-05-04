class GoogleController < ApplicationController

# Checks that there is a currently authunticated user. 
before_filter :authenticate_user!

# BY : AhmedAdelIbrahim.
# Add Google plus attributes to a user who want to add more circles to his RAYE7 account.
# The variables : @user => current user , @provide1 => get the name of the provider.  
                # @user.gmail => user's gmail.
  def create
    @user = current_user
    @auth = request.env["omniauth.auth"]
   
    @token = @auth["credentials"]["token"]
     
    @client = Google::APIClient.new
    @client.authorization.access_token = @token
    @plus = @client.discovered_api('plus')
     @contacts = @client.execute(@plus.people.list, :collection => 'visible',
                                                    :userId => 'me')
    @user.provide1 = @contacts
    @user.gmail=env["omniauth.auth"].info.email
    @user.save! 
    redirect_to root_path
  end
    
# BY : AhmedAdelIbrahim.
# Destroy a session opened.
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
