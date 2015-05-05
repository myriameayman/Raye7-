class Notification < ActiveRecord::Base
  attr_accessible :notified, :notifying, :text
end
