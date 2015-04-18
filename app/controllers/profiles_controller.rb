class ProfilesController < ApplicationController
    before_filter :authenticate_user!
  def new
  end

  def create
  end

  def show
    @user = User.find(params[:id])
    @request = Request.find(params[:request_id])
  end

  def search
    @requests = Request.search params[:search]
  end
  

  def delete
  end

  def index 
    @requests = Request.search(params[:search])
  end

  def edit
  end

  def myAccount
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
          if   current_user.present?
            #PublicActivity::Activity.find(:all, :order => "created_at desc", :limit => 10).reverse
          # do something
            @activities = PublicActivity::Activity.find(:all, :order => "created_at desc", :limit => 5)
            #@activities = PublicActivity::Activity.order("created_at desc",:limit =>4 )#.where(owner_id: current_user.friend_ids, owner_type: "User")
          end
      else
        redirect_to new_user_session_path
      end
  end
  
end
