class UsersController < ApplicationController  
	before_filter :login_required, :only => :my_account
    
    
  	def index
  		redirect_to(:action => 'new')
  	end
    
    def show
      redirect_to(:action => 'my_account')
    end
    
    def new  
      @user = User.new
      
    end 

    # POST users
    def create  
      @user = User.new(user_params)  
      if @user.save  
        redirect_to :log_in, :notice => "Signed up!"  
      else  
        render "new"  
      end  
    end

  def login  
  
  end  
      
  def process_login  

    user = User.authenticate(params[:username], params[:password])  
    
   if user  
    
      session[:user_id] = user.id  
    
      redirect_to :my_account, :notice => "Logged in!"  
    
   else  
   
      flash.now.alert = "Invalid email or password"  
   
      render "login"  
   
    end 

 

  end  
  
  def my_account 

               
        @user=User.find(session[:user_id])
        
      if session[:user_id] != nil
        #@user = User.find(session[:user_id])
         @sessUserName = User.find(session[:user_id]).username
         
     
      else
      	@sessUserName = "Guest"
      
      
      end

  
  end
  

  def logout
  
  	session[:user_id] = nil
  	redirect_to :log_in , :notice => "Logged out!"
  
  end 


  private
    def user_params
      params.require(:user).permit(:firstName, :lastName, :username, :password_hash, :password_salt, :password, :password_confirmation)
    end
   
  end  