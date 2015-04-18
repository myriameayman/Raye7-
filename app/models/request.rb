class Request < ActiveRecord::Base
	  belongs_to :user
	  has_many :trip
	  attr_accessible :air_conditioner, :car_color, :car_model, :car_number, :lat_curr, :lat_destination, :long_curr, :long_destination, :seats, :smoking, :trunk
include PublicActivity::Model
tracked owner: -> (controller, model) {controller && controller.current_user}
def self.search(search)
find(:all, :conditions => ['destination LIKE ?', search])
end

end