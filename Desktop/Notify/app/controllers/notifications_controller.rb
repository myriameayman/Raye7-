class NotificationsController < ApplicationController
	def index
	 @id=current_user.id
	 @notifications=Notification.find(:all,:conditions => ['notified LIKE ?', @id])
	end

end
