class ApplicationController < ActionController::Base
  
  	def signout                                             
	  	if something_is_not_kosher
	  		redirect_to signout_path and return
		end
	end

end
