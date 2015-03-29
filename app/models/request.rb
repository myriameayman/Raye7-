class Request < ActiveRecord::Base
  belongs_to :user
  attr_accessible :air_conditioner, :car_color, :car_model, :car_number, :lat_curr, :lat_destination, :long_curr, :long_destination, :seats, :smoking, :trunk
end
