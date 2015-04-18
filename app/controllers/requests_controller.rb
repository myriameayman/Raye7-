class RequestsController < ApplicationController

  
# Show shows a specific requests with a certain id.
# If it doesn't found it it will redirect it to home page again.
  def show
        @user = current_user
        @id = params[:id]
    if (Request.exists?(@id))
      @request = Request.find(@id)

    else
      redirect_to "/"
    end
    
  end


  def index 
    unless(params[:search==nil])
    @requests = Request.search(params[:search])
    end
  end
   

  def new
    @@i = 0 
    redirect_to "/home"
  end
  
  def home 
    @@i = @@i + 1 
  end



  def geocoding
    respond_to do |format|               
      format.js
    end
  end

  def create
  end

  

  def reverse_geocoding
    respond_to do |format|               
      format.js
    end
  end
  
  def update
  end
  
  def create_ride_info
    @color = params[:car_color]
    @model = params[:car_model]
    @number = params[:car_number]
    @seats = params[:seats]
    @smoking = params[:smoking]
    @air_conditioner = params[:air_conditioner]
    @@request.car_color = @color 
    @@request.car_model= @model
    @@request.car_number= @number
    @@request.seats= @seats
    @@request.smoking= @smoking
    @@request.air_conditioner= @air_conditioner
    @@request.save
    redirect_to "/home"
  end 
  
  def edit
  end

  def delete
  end
end

