class GoogleController < ApplicationController

# Checks that there is a currently authunticated user. 
before_filter :authenticate_user!

  def create
  	@user = current_user
  	@user.provide1 = env["omniauth.auth"].provide1
    
  	@user.gmail=env["omniauth.auth"].info.email
    
    @user.save! 
    redirect_to root_path
  
    end

  def destroy
  	session[:user_id] = nil
    redirect_to root_path
  end
end
