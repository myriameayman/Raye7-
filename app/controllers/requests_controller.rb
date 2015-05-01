# Step of the offering ride form. 
@@form_step = nil 
# Request to be created in the offering ride form. 
@@request = nil
class RequestsController < ApplicationController 

# Make sure there is a currently logged in user. 
  before_filter :authenticate_user! 
# Show shows a specific requests with a certain id.
# If it doesn't found it it will redirect it to home page again.
  def show 
    @user = current_user 
    @id = params[:id] 
    if (Request.exists?(@id)) 
      @request = Request.find(@id) 
      hi = 2
      h = 3
      @request.distance = distance(@request.long_curr,@request.lat_curr,@request.long_destination,@request.lat_destination)
      @request.save
    else 
      redirect_to "/" 
    end 
    
  end

 # this method calculates the estimated distance between two places in kilometers
 # given their longitude and latitude
  def distance(long1, lat1, long2, lat2)
    rad_per_deg = Math::PI/180  # PI / 180
    rkm = 6371                  # Earth radius in kilometers

    dlat_rad = (lat2-lat1) * rad_per_deg  # Delta, converted to rad
    dlon_rad = (long2-long1) * rad_per_deg

    lat1_rad = lat1 * rad_per_deg
    long1_rad = long1 * rad_per_deg
    lat2_rad = lat2 * rad_per_deg
    long2_rad = long2 * rad_per_deg
    # lat1_rad, lon1_rad = loc1.map {|i| i * rad_per_deg }
    # lat2_rad, lon2_rad = loc2.map {|i| i * rad_per_deg }

    a = Math.sin(dlat_rad/2)**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin(dlon_rad/2)**2
    c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a))

    rkm * c # Delta in kilometers
  end
  
  

  def update  
  end 
  

  # Choose one stage from the offer. 
  # @@i = 1 indicates stage 1 of the form.
  # /home is redirected to home view. 
  # /requests/create is redireted to the create view in requests folder.
  def create_curr_location 
    if @@form_step == nil 
      redirect_to root_path  
    end
    if @@form_step == 1 
      @latitude = params[:latitude] 
      @longitude = params[:longitude] 
      @@request.lat_curr = @latitude 
      @@request.long_curr= @longitude 
      redirect_to url_for(:controller => "requests", :action => "home")
    else 
      @latitude = params[:latitude] 
      @longitude = params[:longitude] 
      @loc = params[:loc]
      @@request.lat_destination = @latitude 
      @@request.long_destination= @longitude 
      @@request.destination= @loc

      redirect_to url_for(:controller => "requests", :action => "create")  

    end 
  end 
  
  
# Index return a list of all available requests.
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

    @@form_step = 0  
    redirect_to url_for(:controller => "requests", :action => "home")

  end 
  
  
  # Moving from stage of creating a request's form to the next stage. 
  def home 

    if @@form_step == nil 
      redirect_to root_path  and return 
    end
    @@request.user_id = current_user.id 
    @@form_step = @@form_step + 1 

  end 

  
# Responding on clicking on geocoding link in home. 
  def geocoding 
    respond_to do |format|               
      format.js 
    end 
  end 


# Responding on clicking on reverse_geocoding link in home.
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
    @@request.save 
    redirect_to root_path 
  end 

  

  def edit 
  end


  def delete 
  end 
 
end
