class ProfilesController < ApplicationController
    before_filter :authenticate_user!
  def new
    flash[:notice] = "Verification message has sent to your email"
  end

  def create
  end


  def show
    @user = User.find(params[:id])
    @request = Request.find(params[:request_id])
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

  def unverified
    flash[:notice] = "Verification message has sent to your email"

  end

  def verifyMe
    @user = current_user
    @user.verification = true    
    redirect_to url_for(:controller => "profile", :action => "myAccount") and return
  end


  def myAccount
# Getting the current login user to retrieve all the info in the profile page  
      unless(current_user == nil)      
          @user = current_user
          if(@user.uid==nil)
            MyMailer.gmail_email(@user).deliver
            flash[:notice] = "Confirmation message has sent to your email"
           # MyMailer.sample_email(@user).deliver
            redirect_to "/auth/facebook" and return
          end
          if(@user.verification == false )
            redirect_to url_for(:controller => "profiles", :action => "new")
          end
          unless(params[:search==nil])
            @requests = Request.search params[:search]
          end
          
          #MyMailer.sample_email(@user).deliver
          @circles = @user.circles
          session[:user_id]  = current_user.id
          if   current_user.present?
            #PublicActivity::Activity.find(:all, :order => "created_at desc", :limit => 10).reverse
         
            @activities = PublicActivity::Activity.find(:all, :order => "created_at desc", :limit => 5)

          end
      else
        redirect_to new_user_session_path
      end
  end
end
