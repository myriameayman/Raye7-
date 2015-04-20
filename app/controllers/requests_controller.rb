# Step of the offering ride form. 
<<<<<<< HEAD
@@i = nil 
# Request to be created in the offering ride form. 
@@request = nil
class RequestsController < ApplicationController 
  # Make sure there is a currently logged in user. 
  before_filter :authenticate_user! 

  def search 
   @requests = Request.search(params[:search]) 
  end 
  
 

=======
@@form_step = nil 
# Request to be created in the offering ride form. 
@@request = nil
class RequestsController < ApplicationController 

# Make sure there is a currently logged in user. 
  before_filter :authenticate_user! 

 
 
# Show shows a specific requests with a certain id.
# If it doesn't found it it will redirect it to home page again.
>>>>>>> c276b045cd32c5897a2360346cc3d56199269709
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
<<<<<<< HEAD
    if @@i == nil 
      redirect_to "/profiles/myAccount"  
    end
    if @@i == 1 
=======
    if @@form_step == nil 
      redirect_to root_path  
    end
    if @@form_step == 1 
>>>>>>> c276b045cd32c5897a2360346cc3d56199269709
      @latitude = params[:latitude] 
      @longitude = params[:longitude] 
      @@request.lat_curr = @latitude 
      @@request.long_curr= @longitude 
<<<<<<< HEAD
      redirect_to "/home" 
=======
      redirect_to url_for(:controller => "requests", :action => "home")
>>>>>>> c276b045cd32c5897a2360346cc3d56199269709
    else 
      @latitude = params[:latitude] 
      @longitude = params[:longitude] 
      @loc = params[:loc]
      @@request.lat_destination = @latitude 
      @@request.long_destination= @longitude 
      @@request.destination= @loc
<<<<<<< HEAD
      redirect_to "/requests/create" 
=======
      redirect_to url_for(:controller => "requests", :action => "create")  
>>>>>>> c276b045cd32c5897a2360346cc3d56199269709
    end 
  end 
  
  
<<<<<<< HEAD

=======
# Index return a list of all available requests.
>>>>>>> c276b045cd32c5897a2360346cc3d56199269709
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
<<<<<<< HEAD
    @@i = 0 
    redirect_to "/home" 
=======
    @@form_step = 0  
    redirect_to url_for(:controller => "requests", :action => "home")
>>>>>>> c276b045cd32c5897a2360346cc3d56199269709
  end 
  
  
  # Moving from stage of creating a request's form to the next stage. 
  def home 
<<<<<<< HEAD
    if @@i == nil 
      redirect_to "/profiles/myAccount"  and return 
    end
    @@request.user_id = current_user.id 
    @@i = @@i + 1 
  end 

  

=======
    if @@form_step == nil 
      redirect_to root_path  and return 
    end
    @@request.user_id = current_user.id 
    @@form_step = @@form_step + 1 
  end 

  
# Responding on clicking on geocoding link in home. 
>>>>>>> c276b045cd32c5897a2360346cc3d56199269709
  def geocoding 
    respond_to do |format|               
      format.js 
    end 
  end 


<<<<<<< HEAD
 
=======
# Responding on clicking on reverse_geocoding link in home.
>>>>>>> c276b045cd32c5897a2360346cc3d56199269709
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
<<<<<<< HEAD
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
=======
>>>>>>> c276b045cd32c5897a2360346cc3d56199269709
    @@request.save 
    redirect_to root_path 
  end 
  
<<<<<<< HEAD
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
=======
>>>>>>> c276b045cd32c5897a2360346cc3d56199269709

  def edit 
  end 


<<<<<<< HEAD

  def delete 
  end 
 
end 


=======
  def delete 
  end 
 
end
>>>>>>> c276b045cd32c5897a2360346cc3d56199269709
