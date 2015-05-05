class Place < ActiveRecord::Base
  	has_many :visits
  	has_many :users, through: :visits
  	attr_accessible :lat, :long, :name
  	validates_uniqueness_of :lat, :scope => [:long]
end
