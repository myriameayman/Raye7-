class TripsController < ApplicationController


# first I need to create Trip Variable. 
@@trip = Trip.new


# The method create assigns user id who requested to join this trip with the id of the trip.
# It will not let the user join the trip unless no of seats is greater than 0.
# After joining trip it redirected the user back to the home page.
# TODO : printing confirmation msg after joining a trip.
# TODO : printing error msg if the user cannot be added to a ride.
# The vaiables :@id is the user id.
#			   :@@trip.user_id assigns user id to trip.user_id.
#              :@@trip.request_id assigns request id to trip.request_id.
def create
	unless(params[:id==nil])
		  @id = current_user.id
		  @@trip.user_id = @id 
		  @@trip.request_id= params[:id]
		  unless(params[:id] == nil)
		  @request=Request.find(params[:id])
		  	
		  	if(@request.seats>0)
		  	 @request.seats=@request.seats - 1
		  	 @request.save
		 	 @@trip.save
			end
		  end
		  redirect_to "/"
	end
end

def index 
	unless(params[:id==nil])
  @trips = Trip.find(params[:id])
end
 end




end
