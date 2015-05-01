class PlacesController < ApplicationController
	# To make sure that the user has logged in before reaching this line. 
	before_filter :authenticate_user!
	
	# Show the places of the current user. 
	# @places is an arrayList that contain all places of the current_user. 
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
    # @myriame 
    # List all the places of a specific friend using his id. 
    def friend_places 
    	@user = User.find(params[:id])
    	@places = [] 
		@visits = Visit.find(:all, :conditions => ['user_id LIKE ?' , @user.id])
		@visits.each do |v| 
			place = Place.find(:all, :conditions => ['id LIKE ?' , v.place_id])
			place.each do |p|
				@places << p 
			end  
		end 	
    end	
    # Show a specific place of the user. 
    # @id is the id of the place to be shown. 
    def show
   	 	@id = params[:id] 
    	if (Place.exists?(@id)) 
      		@place = Place.find(@id) 
    	else 
      		redirect_to "/" 
    	end 
    end 	
end
