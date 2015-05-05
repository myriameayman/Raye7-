class Tag < ActiveRecord::Base
  attr_accessible :current_user, :request_id, :user_id
  has_many:requests
  has_many:users
end
