class TripsController < ApplicationController
@@trip = Trip.new
def create

	unless(params[:id==nil])
		  @id = current_user.id
		  @@trip.user_id = @id 
		  @@trip.request_id= params[:id]
		  @request=Request.find(params[:id])
		  	if(@request.seats>0)
		  	 @request.seats=@request.seats - 1
		  	 @request.save
		 	 @@trip.save
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
