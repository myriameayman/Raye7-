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
      unless(current_user == nil)      
          @user = current_user
          @circles = @user.circles
          session[:user_id]  = current_user.id
      else
        redirect_to new_user_session_path
      end
  end

  def newLinkedin
  end
  protected
    #def after_sign_up_path_for(resource)
     # redirect_to "/auth/facebook" and return
      #signed_in_root_path(resource)
    #end

   # def after_update_path_for(resource)
    #  signed_in_root_path(resource)
    #end



end
