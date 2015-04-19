# Step of the offering ride form. 
@@i = nil 
# Request to be created in the offering ride form. 
@@request = nil
class RequestsController < ApplicationController 
  # Make sure there is a currently logged in user. 
  before_filter :authenticate_user! 

  def search 
   @requests = Request.search(params[:search]) 
  end 
  
 

  def show 
    @user = current_user 
    @id = params[:id] 
    if (Request.exists?(@id)) 
      @request = Request.find(@id) 

    else 
      redirect_to "/" 
    end 
    
  end 
  
  

  def update  
  end 
  

  # Choose one stage from the offer. 
  # @@i = 1 indicates stage 1 of the form.
  # /home is redirected to home view. 
  # /requests/create is redireted to the create view in requests folder.
  def create_curr_location 
    if @@i == nil 
      redirect_to "/profiles/myAccount"  
    end
    if @@i == 1 
      @latitude = params[:latitude] 
      @longitude = params[:longitude] 
      @@request.lat_curr = @latitude 
      @@request.long_curr= @longitude 
      redirect_to "/home" 
    else 
      @latitude = params[:latitude] 
      @longitude = params[:longitude] 
      @loc = params[:loc]
      @@request.lat_destination = @latitude 
      @@request.long_destination= @longitude 
      @@request.destination= @loc
      redirect_to "/requests/create" 
    end 
  end 
  
  

  def index 
    unless(params[:search==nil]) 
      @requests = Request.search(params[:search]) 
    end 
  end 
   
  def create 
  end 
  
    

  # @@request the request to be createad using new request. 
  # Create new request.  
  def new 
    @@request = Request.new
    @@i = 0 
    redirect_to "/home" 
  end 
  
  
  # Moving from stage of creating a request's form to the next stage. 
  def home 
    if @@i == nil 
      redirect_to "/profiles/myAccount"  and return 
    end
    @@request.user_id = current_user.id 
    @@i = @@i + 1 
  end 

  

  def geocoding 
    respond_to do |format|               
      format.js 
    end 
  end 


 
  def reverse_geocoding 
    respond_to do |format|               
      format.js 
    end 
  end 
  
  
 
  # Saves the info in stage 3 of the form in the db. 
  # Profiles/myAccount redirectes to the user's profile page. 
  def create_ride_info 
    @color = params[:car_color] 
    @model = params[:car_model] 
    @number = params[:car_number] 
    @seats = params[:seats] 
    @smoking = params[:smoking] 
    @air_conditioner = params[:air_conditioner]
    @trunk = params[:trunk] 
    @name = params[:name] 
    @@request.car_color = @color 
    @@request.car_model= @model 
    @@request.car_number= @number 
    @@request.seats= @seats 
    @@request.smoking= @smoking 
    @@request.air_conditioner= @air_conditioner
    @@request.trunk= @trunk 
    @@request.name= @name 
    #@str = "<div>
     #         <ul>
      #        <% @@request.errors.each_with_index do |msg, i| %>
      #           <li><%= msg[1] %></li>
      #        <% end %>
      #        </ul>
      #      </div>".html_safe
    #if @@request.errors.any? 
     #  redirect_to "/requests/create_ride_info" 
    #end           
    @@request.save 
    redirect_to root_path 
  end 
  
  def delete_request
     @Request = Request.find (params[:id])
   
      unless (Trip.where(request_id: params[:id])==nil)
        @trip = Trip.where(request_id: params[:id])
         @trip.each do |tri|
     @Notification = Notification.new
     @Notification.user_id  = tri.user_id 
     @Notification.text = 'Sorry your trip is cancelled'
     @Notification.save
         end 
       end 
     Request.find(params[:id]).destroy
     redirect_to"/"
   end 

  def edit 
  end 



  def delete 
  end 
 
end 


