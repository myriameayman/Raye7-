class Friend < ActiveRecord::Base
  	attr_accessible :circle_id, :name
  	belongs_to :circle

  	def self.search(search)
	  if search
	    find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
	  else
	    find(:all)
	  end
	end
end
