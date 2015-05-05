# Step of the offering ride form. 
@@form_step = nil 
# Request to be created in the offering ride form. 
@@request = nil
# List of all checkpoints created by the user.
@@checkpoint = nil   
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

  def calculate_value(x,y)
    x + y
  end

  def distance(long1, lat1, long2, lat2)
    rad_per_deg = Math::PI/180  # PI / 180
    rkm = 6371                  # Earth radius in kilometers
    rm = rkm * 1000             # Radius in meters

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

    rkm * c # Delta in meters
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
      @loc = params[:loc]
      @@request.lat_curr = @latitude 
      @@request.long_curr= @longitude 
      @@request.currentLoc= @loc
      redirect_to url_for(:controller => "requests", :action => "home")
    else  
      @latitude = params[:latitude] 
      @longitude = params[:longitude] 
      @destination = params[:loc]
      @@request.lat_destination = @latitude 
      @@request.long_destination= @longitude 
      @@request.destination= @destination
      redirect_to url_for(:controller => "requests", :action => "create_route")  

  end 
  
end  
# Index return a list of all available requests.
  def index 
    unless(params[:search==nil]) 
      @requests = Request.search(params[:search]) 
    end 
  end 
   
# @myriame 
# Create max checkpoints for the user.     
  def create 
    @name1 = params[:name1]
    @name2 = params[:name2]
    @name3 = params[:name3]
    @name4 = params[:name4]
    @name5 = params[:name5]
    @name6 = params[:name6]

    @long1 = params[:long1]
    @long2 = params[:long2]
    @long3 = params[:long3]
    @long4 = params[:long4]
    @long5 = params[:long5]
    @long6 = params[:long6]
    
    @lat1 = params[:lat1]
    @lat2 = params[:lat2]
    @lat3 = params[:lat3]
    @lat4 = params[:lat4]
    @lat5 = params[:lat5]
    @lat6 = params[:lat6]
    
    unless(@name1 == nil) 
      places = Place.find(:all, :conditions => ['name LIKE ? AND long LIKE ? AND 
        lat LIKE ?' , @name1, @long1 , @lat1])
      #unless (places.empty?)
        p = Place.new 
        p.name = @name1 
        p.lat = @lat1 
        p.long = @long1 
        p.save  
        @@checkpoint << p 
      #end 
    end
    unless(@name2 == nil) 
      places = Place.find(:all, :conditions => ['name LIKE ? AND long LIKE ? AND 
        lat LIKE ?' , @name2, @long2 , @lat2])
      #unless (places.empty?)
        p = Place.new 
        p.name = @name2 
        p.lat = @lat2 
        p.long = @long2 
        p.save 
        @@checkpoint << p
       # end 
    end
    unless(@name3 == nil) 
      places = Place.find(:all, :conditions => ['name LIKE ? AND long LIKE ? AND 
        lat LIKE ?' , @name3, @long3 , @lat3])
     # unless (places.empty?)
        p = Place.new 
        p.name = @name3 
        p.lat = @lat3 
        p.long = @long3 
        p.save 
        @@checkpoint << p
      #end
    end  
    unless(@name4 == nil) 
      places = Place.find(:all, :conditions => ['name LIKE ? AND long LIKE ? AND 
        lat LIKE ?' , @name4, @long4 , @lat4])
      #unless (places.empty?)
        p = Place.new 
        p.name = @name4 
        p.lat = @lat4 
        p.long = @long4 
        p.save 
        @@checkpoint << p
      #end 
    end  
    unless(@name5 == nil) 
      places = Place.find(:all, :conditions => ['name LIKE ? AND long LIKE ? AND 
        lat LIKE ?' , @name5, @long5 , @lat5])
      #unless (places.empty?)
        p = Place.new 
        p.name = @name5 
        p.lat = @lat5 
        p.long = @long5 
        p.save 
        @@checkpoint << p
      #end 
    end 
    unless(@name6 == nil) 
      places = Place.find(:all, :conditions => ['name LIKE ? AND long LIKE ? AND 
        lat LIKE ?' , @name6, @long6 , @lat6])
      #unless (places.empty?)
        p = Place.new 
        p.name = @name6 
        p.lat = @lat6 
        p.long = @long6 
        p.save 
        @@checkpoint << p
      #end 
    end 
  end 
  

  # @myriame 
  # Create a route between currLoc and destination. 
  def create_route 
    @curLoc = @@request.currentLoc 
    @destination = @@request.destination

  end  

# @myriame 
# Creates checkpoints between current location and destination. 
  def create_checkpoints 
    @curLoc = @@request.currentLoc 
    @destination = @@request.destination     
  end  
  # @@request the request to be createad using new request. 
  # Create new request.  
  def new 
    @@request = Request.new
    @@checkpoint = []  
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
    @girls = params[:girls]
    @gentlemen = params[:gentlemen] 
    @@request.car_color = @color 
    @@request.car_model= @model 
    @@request.car_number= @number 
    @@request.seats= @seats 
    @@request.smoking= @smoking 
    @@request.air_conditioner= @air_conditioner
    @@request.trunk= @trunk 
    @@request.name= @name 
    @@request.girls_only = @girls
    @@request.gentlemen_only = @gentlemen 
    @@request.save  
    @@checkpoint.each do |x| 
      c = Checkpoint.new 
      c.place_id = x.id 
      c.request_id = @@request.id 
      c.save 
    end 
    redirect_to root_path 
  end 

  

  def edit 
  end


  def delete 

  end 
 
end

