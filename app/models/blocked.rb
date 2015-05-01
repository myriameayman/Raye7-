class Blocked < ActiveRecord::Base
  	attr_accessible :friend_id
  	#belongs_to :user
  	belongs_to :circle
end
