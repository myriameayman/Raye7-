class Place < ActiveRecord::Base
    has_many :visits
    has_many :users, through: :visits
    has_many :checkpoints
    has_many :requests, through: :checkpoints
    attr_accessible :lat, :long, :name
end
