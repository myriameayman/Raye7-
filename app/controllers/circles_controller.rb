class CirclesController < ApplicationController
	before_filter :authenticate_user!
  def index
  end

# Having an id of a circle find it and save it to a variable @circle 
  def show
  	@user = current_user
  	if (Circle.exists?(params[:id]))
  		@circle = Circle.find(params[:id])
      
  		  unless(@user.circles.exists?(@circle))
  			 redirect_to "/"
  		  end
    
  	else
  		redirect_to "/"
  	end

  end

  def create
  end

  def delete
  end


# @mariamTalaat 
#  def Block_Circle



  
def Block_Circle 

 unless(params[:id==nil])
  @circlee = Circle.find (params[:id]) # Searching for the Circle with id gotten from URL
  @Circlee = BlockedCircle.new         # Adding this Cicrle to the The Blocked Table   
  @Circlee.id = @circlee.id           
  @Circlee.user_id = @circlee.user_id
  @Circlee.save                        # Saving it after setting its values 
  @friends = Friend.find where(:circle_id => @circlee.id).all   # Finding Friends related to that Circle
    @friends.each do |f|
      @blocked = Blocked.new                                    #Adding it to table blocked
      @blocked.friend_id = f.id
      @blocked.circle_id=@circlee.id
      @blocked.save 
      Friend.where(:id => f.id).destroy                        # Deleting both Friends and Circles  
                                                               #   from circles and Friends Models 
     end
     Circle.where(:id => @circlee.id).destroy
 end
   redirect_to "/"
end





end
end
