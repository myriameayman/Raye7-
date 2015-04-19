class Request < ActiveRecord::Base
<<<<<<< HEAD
 belongs_to :user
 has_many :trip
 attr_accessible :air_conditioner, :car_color, :car_model, :car_number, :lat_curr, :lat_destination, :long_curr, :long_destination, :seats, :smoking, :trunk, :destination
 validates :seats, :numericality => { :greater_than => 0 }


# The def search searches for requests that satisfies conditions of search passed parameter.
 def self.search(search)
  find(:all, :conditions => ['destination LIKE ?', search])
 end

end