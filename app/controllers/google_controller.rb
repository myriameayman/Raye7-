class GoogleController < ApplicationController
  before_filter :authenticate_user!

  def create
  	@user = current_user
  	@user.provider = env["omniauth.auth"].provider
    
  	@user.gmail=env["omniauth.auth"].info.email
    
    @user.save! 
    redirect_to root_path
  
    end

  def destroy
  	session[:user_id] = nil
    redirect_to root_path
  end
end
