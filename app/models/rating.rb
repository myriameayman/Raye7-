class Rating < ActiveRecord::Base
  attr_accessible :stars, :user_id
  belongs_to :user
end
