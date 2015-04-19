class Request < ActiveRecord::Base
	  belongs_to :user
	  has_many :trip
	  attr_accessible :air_conditioner, :car_color, :car_model, :car_number, :lat_curr,
	   :lat_destination, :long_curr, :long_destination, :seats, :smoking, :trunk, :user_id
	  #validates :air_conditioner, presence: true
	  validates :user_id, presence: true
	  #validates :car_color, presence: true
	  #validates :car_model, presence: true
	  #validates :car_number, presence: true 
	  validates :lat_curr, presence: true
	  validates :lat_destination, presence: true
	  validates :long_curr, presence: true
	  validates :long_destination, presence: true
	  validates :seats, presence: true
	  #validates :smoking, presence: true
	  #validates :trunk, presence: true
	  validates :seats, numericality: { only_integer: true }
	  validates_format_of :car_color, :with => /^[-a-z]+$/
	  include PublicActivity::Model
		tracked owner: -> (controller, model) {controller && controller.current_user}
	  #validate :my_string_is_valid
	  def self.search(search)
		find(:all, :conditions => ['destination LIKE ?', search])
	  end
	  def my_string_is_valid
        self.errors.add :base, 'My string can not be nil' if self.air_conditioner.nil?
        self.errors.add :base, 'My string can not be nil' if self.car_color.nil? 
	  end
end