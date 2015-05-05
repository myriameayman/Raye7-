class NotificationsController < ApplicationController
def index
<<<<<<< HEAD
	@notifications=Notification.all
end
=======
	 @id=current_user.id
	 @notifications=Notification.find(:all,:conditions => ['notified LIKE ?', @id])
	end
>>>>>>> 8e67d53a262cebb88f319b700bc63f2ea3c172cf
end
