class PlacesController < ApplicationController
	def show 
		#@id = current_user.id 
		@places = [] 
		@visits = Visit.find(:all, :conditions => ['user_id LIKE ?' , 1])
		@visits.each do |v| 
			place = Place.find(:all, :conditions => ['id LIKE ?' , v.place_id])
			place.each do |p|
				@places << p 
			end  
		end 	 	
    end
end
