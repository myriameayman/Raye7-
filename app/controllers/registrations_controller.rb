class RegistrationsController < Devise::RegistrationsController


  def new
    super
  end


  def create 	
  	super
  end

  def edit
  	super
  end

  def update
    super
  end

  def myAccount  
      if(current_user != nil)      
          @sessUserEmail = current_user.username
          session[:user_id]  = current_user.id
          if session[:user_id] != nil
            #@user = User.find(session[:user_id])
             @sessUserName = User.find(session[:user_id]).username            
          else
          	@sessUserName = "Guest"      
          end
      else
        redirect_to new_user_session_path
      end
  end

  def newLinkedin
  end



end
