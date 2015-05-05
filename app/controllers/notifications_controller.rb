class NotificationsController < ApplicationController
# List all notification of a specific user.
	def index
	 @id=current_user.id
	 @notifications=Notification.find(:all,:conditions => ['notified LIKE ?', @id])
	end

end
