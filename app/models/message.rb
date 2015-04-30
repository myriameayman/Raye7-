class Message < ActiveRecord::Base
  belongs_to :conversation
  belongs_to :user
  attr_accessible :body
end
