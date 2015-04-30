class ProfilesController < ApplicationController
    before_filter :authenticate_user!
  def new
  end

  def create
  end

 # @myriame 
 # Load a profile of a specific friend.
  def friend_profile
    @user = User.find(params[:id])
  end

  def search
    unless(params[:search==nil])
    @requests = Request.search params[:search] 
  end

  end
  

  def delete
  end


  def index 
    @requests = Request.search(params[:search])
  end

  def edit
  end


  def myAccount
# Getting the current login user to retrieve all the info in the profile page  
      unless(current_user == nil)      
          @user = current_user
          if(@user.uid==nil)
            redirect_to "/auth/facebook" and return
          end
          unless(params[:search==nil])
            @requests = Request.search params[:search]
          end
          @circles = @user.circles
          session[:user_id]  = current_user.id
      else
        redirect_to new_user_session_path
      end
  end
end
