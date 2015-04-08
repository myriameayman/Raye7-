class RequestsController < ApplicationController
  @@request = Request.new
  def index
  end

  def new
    @@i = 0 
    redirect_to "/home"
  end
  def home 
    @@i = @@i + 1 
    end 
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
