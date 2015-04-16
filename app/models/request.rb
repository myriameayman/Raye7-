class Request < ActiveRecord::Base
	  belongs_to :user
	  has_many :trip
	  attr_accessible :air_conditioner, :car_color, :car_model, :car_number, :lat_curr, :lat_destination, :long_curr, :long_destination, :seats, :smoking, :trunk
	  validates :air_conditioner, presence: true, presence: { message: "can't leave any blank fields" }
	  validates :car_color, presence: true, presence: { message: "can't leave any blank fields" }
	  validates :car_model, presence: true, presence: { message: "can't leave any blank fields" }
	  validates :car_number, presence: true , presence: { message: "can't leave any blank fields" }
	  validates :lat_curr, presence: true, presence: { message: "can't leave any blank fields" }
	  validates :lat_destination, presence: true, presence: { message: "can't leave any blank fields" }
	  validates :long_curr, presence: true, presence: { message: "can't leave any blank fields" }
	  validates :long_destination, presence: true, presence: { message: "can't leave any blank fields" }
	  validates :seats, presence: true, presence: { message: "can't leave any blank fields" }
	  validates :smoking, presence: true, presence: { message: "can't leave any blank fields" }
	  validates :trunk, presence: true, presence: { message: "can't leave any blank fields" }
	  validates :seats, numericality: { only_integer: true }, presence: { message: "can't leave any blank fields" }
	  validates_format_of :car_color, :with => /^[-a-z]+$/
	  validate :my_string_is_valid
	  def self.search(search)
		find(:all, :conditions => ['destination LIKE ?', search])
	  end
	  def my_string_is_valid
        self.errors.add :base, 'My string can not be nil' if self.air_conditioner.nil?
        self.errors.add :base, 'My string can not be nil' if self.car_color.nil? 
	  end
end