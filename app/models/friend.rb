class Friend < ActiveRecord::Base
  	attr_accessible :circle_id, :name
  	belongs_to :circle
  	validates :app_id, presence: true

end
