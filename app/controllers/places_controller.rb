class PlacesController < ApplicationController
	@@request = Request.new
	
	def show
	    if @@i == 1
	      @latitude = params[:latitude]
	      @longitude = params[:longitude]
	      @@request.lat_curr = @latitude 
	      @@request.long_curr= @longitude
	      redirect_to "/home"
	    else 
	      @latitude = params[:latitude]
	      @longitude = params[:longitude]
	      @@request.lat_destination = @latitude 
	      @@request.long_destination= @longitude
	      redirect_to "/requests/create"
    	end
    end

end

#@places = [] 
		#@visits = Visit.find(:all, :conditions => ['user_id LIKE ?' , 1])
		#@visits.each do |v| 
		#	place = Place.find(:all, :conditions => ['id LIKE ?' , v.place_id])
		#	place.each do |p|
		#		@places << p 
		#	end  
		#end 