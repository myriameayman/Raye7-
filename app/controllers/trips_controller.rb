class TripsController < ApplicationController
@@trip = Trip.new
def create

	unless(params[:id==nil])
	@id = current_user.id
	@@trip.user_id = @id 
	@@trip.request_id= params[:id]
	@@trip.save
	redirect_to "/"
	end
end
def index 
	unless(params[:id==nil])
  @trips = Trip.search(params[:id])
end
 end


end
