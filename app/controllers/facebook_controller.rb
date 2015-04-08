class FacebookController < ApplicationController
	before_filter :authenticate_user!

  def create
  	@user = current_user
  	@user.provider = env["omniauth.auth"].provider
    @user.uid = env["omniauth.auth"].uid
    @user.fb_email = env["omniauth.auth"].info.email
    @user.faceboook_profileimage=env["omniauth.auth"].info.image
    @user.oauth_token = env["omniauth.auth"].credentials.token
    @user.save!
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
