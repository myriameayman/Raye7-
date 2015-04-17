class PlacesController < ApplicationController
	# to make sure that the user has logged in before reaching this line 
	before_filter :authenticate_user!
	
	# show the places of the current user 
	def create 
		@places = [] 
		@visits = Visit.find(:all, :conditions => ['user_id LIKE ?' , current_user.id])
		@visits.each do |v| 
			place = Place.find(:all, :conditions => ['id LIKE ?' , v.place_id])
			place.each do |p|
				@places << p 
			end  
		end 	 	
    end
    def show
   	 	@id = params[:id] 
    	if (Place.exists?(@id)) 
      		@place = Place.find(@id) 

    	else 
      		redirect_to "/" 
    	end 
    end 	
end
