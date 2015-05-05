class Friend < ActiveRecord::Base
  	attr_accessible :circle_id, :name
  	belongs_to :circle
  	validates :app_id, presence: true


  	def self.search(search)
	  if search
	    find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
	  else
	    find(:all)
	  end
	end

  	

end
