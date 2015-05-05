class Visit < ActiveRecord::Base
 	 attr_accessible :place_id, :user_id
 	 validates_uniqueness_of :place_id, :scope => [:user_id]
end
