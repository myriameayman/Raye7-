class ApplicationController < ActionController::Base
	include PublicActivity::StoreController

  #protect_from_forgery with: :exception
  #helper_method :current_user

  #def current_user
   # @current_user ||= User.find(session[:user_id]) if session[:user_id]
  #end
=begin
  def after_sign_in_path_for(resource_or_scope)
	  if resource_or_scope.is_a?(User)
	  	@user=current_user
	    redirect_to "registrations/myAccount" and return
	  else
	    super
	  end
  end
=end

  #def after_sign_up_path_for(resource_or_scope)
  	#redirect_to "profiles/myAccount"  and return
=begin
	  if resource_or_scope.is_a?(User)
	  	@user=current_user
	    redirect_to "registrations/myAccount"  and return
	  else
	    super
	  end
=end

  #end
#def after_sign_in_path_for(resource_or_scope)
  	#redirect_to "profiles/myAccount"  and return
=begin
	  if resource_or_scope.is_a?(User)
	  	@user=current_user
	    redirect_to "registrations/myAccount"  and return
	  else
	    super
	  end
=end

 # end

  	def signout                                             
	  	if something_is_not_kosher
	  		redirect_to signout_path and return
		end
	end
  # before_filter :configure_permitted_parameters, if: :devise_controller?

 # protected

 # def configure_permitted_parameters
  #  devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation,:firstName, :lastName, :remember_me) }
   # devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
    #devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password) }
  #end
end
