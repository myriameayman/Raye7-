class ProfilesController < ApplicationController
    before_filter :authenticate_user!
  def new
  end

  def create
  end


def search
  @requests = Request.search params[:search]
end

  

  def show
  @user = User.find(params[:id])
  @request = Request.find(params[:request_id])
  end


  def delete
  end


  def index 
    @requests = Request.search(params[:search])
  end

  def edit
  end
# Getting the current login user to retrieve all the info in the profile page  
  def myAccount  
      unless(current_user == nil)
          unless(params[:search==nil])
            @requests = Request.search params[:search]

          end
          #@requests = Request.search params[:search]      
          @user = current_user
          @circles = @user.circles
          session[:user_id]  = current_user.id
      else
          redirect_to new_user_session_path
      end
  end
  
end
