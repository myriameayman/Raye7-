class Trip < ActiveRecord::Base
	include PublicActivity::Model
	tracked owner: -> (controller, model) {controller && controller.current_user}
attr_accessible :request_id, :user_id  	
end