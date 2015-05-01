class BlockedCircle < ActiveRecord::Base
  attr_accessible :circle_id
  belongs_to :circle
  belongs_to :user
end
