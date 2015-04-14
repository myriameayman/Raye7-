class PlacesController < ApplicationController
	before_filter :authenticate_user!
	def show 
		#@id = current_user.id 
		@places = [] 
		@visits = Visit.find(:all, :conditions => ['user_id LIKE ?' , current_user.id])
		@visits.each do |v| 
			place = Place.find(:all, :conditions => ['id LIKE ?' , v.place_id])
			place.each do |p|
				@places << p 
			end  
		end 	 	
    end
end
