class ProfilesController < ApplicationController
    before_filter :authenticate_user!
  def new
  end

  def create
  end

  def show
  end

  def delete
  end

  def index
  end

  def edit
  end

  def myAccount  
      unless(current_user == nil)      
          @sessUserUserName = current_user.username
          @user = current_user
          @circles = @user.circles
          session[:user_id]  = current_user.id
      else
        redirect_to new_user_session_path
      end
  end
  
end
