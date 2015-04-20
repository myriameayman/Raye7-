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

 def user_profile_image
   
  @user_profile_image = User.find(params[:id]).profile_image_url
 end


 def my_rating

 @rating = Rating.find(params[:user_id]).stars
 end



  def newLinkedin
  end



end
