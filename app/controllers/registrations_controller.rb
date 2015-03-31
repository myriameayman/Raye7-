class RegistrationsController < Devise::RegistrationsController
 


  def new
    super
  end


  def create
  	
  	super
  	#redirect_to :my_account, :notice => "Logged in!"  and return
  	#return 
    # add custom create logic here
  end
#=begin
  def edit
  	super
  end

  def update
    super
  end


#=end



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

  def newLinkedin
  	new
  end



end
