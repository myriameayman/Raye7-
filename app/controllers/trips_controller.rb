class TripsController < ApplicationController


# The def create assigns user id who requested to join this trip with the id of the trip.
# It will not let the user join the trip unless no of seats is greater than 0.
# After joining trip it redirected the user back to the home page.
# TODO : printing confirmation msg after joining a trip.
# TODO : printing error msg if the user cannot be added to a ride.
# The vaiables :@id is the user id.
#			   :@@trip.user_id assigns user id to trip.user_id.
#              :@@trip.request_id assigns request id to trip.request_id.
def create
	@trip=Trip.new
	unless(params[:id==nil])
		  @id = current_user.id
		  @trip.user_id = @id 
		  @trip.request_id= params[:id]
		unless(params[:id] == nil)
		    @request=Request.find(params[:id])
		 	 	
		  if(@request.seats>0)
		  	 @request.seats=@request.seats - 1
		  	@longD=@request.long_destination
		  	@latD=@request.lat_destination
		 	
			places=Place.find(:all,:conditions => ['long 
			LIKE ? AND  lat LIKE  ?',@longD, @latD ])

	        
			
	 		#@place=Place.where(long=@request.long_destination AND lat=lat_destination)
			 places.each do|x|
			
			@place_id=x.id	
			end
			

			visits=Visit.find(:all,:conditions => ['place_id LIKE ? AND user_id LIKE ?',
				@place_id ,@id])

		   visits.each do|x|
			
			@visit_id=x.id	
			end
			unless(@visits==nil)
				@visits=Visit.find(@visit_id)
				@visits.noVisited=@visits.noVisited+1
				@visits.save
			else
				@visit=Visit.new
				@visit.user_id=@id
				@visit.place_id=@place_id
				@visit.noVisited=1
				@visit.save
			end

		   @trip.save
		   @request.save
		
		end
	end
		   
		  redirect_to "/"
  end
end


# The def index finds all trips of a specific request.
# The variables :@trips :@trips is list of all available trips of a request.
def index 
	unless(params[:id==nil])
     @trips = Trip.find(params[:id])
    end
end




end
