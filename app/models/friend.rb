class Friend < ActiveRecord::Base
  	attr_accessible :circle_id, :name
  	validates :app_id, presence: true
  	belongs_to :circle
<<<<<<< HEAD
  	validates :app_id, presence: true

=======
>>>>>>> 50d541599773cdea3b3515bdeee36a131b5cbbc3

  	def self.search(search)
	  if search
	    find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
	  else
	    find(:all)
	  end
	end
<<<<<<< HEAD

  	

=======
>>>>>>> 50d541599773cdea3b3515bdeee36a131b5cbbc3
end
