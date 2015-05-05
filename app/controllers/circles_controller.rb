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
 @id = params[:id ]
 unless(@id == nil)
  @circlee = Circle.find(@id)                              # Searching for the Circle with id gotten from URL
  @bCircle = BlockedCircle.new                              # Adding this Cicrle to the The Blocked Table   
  @bCircle.circle_id = params[:id]          
  @bCircle.user_id = current_user.id 
  @bCircle.save                                              # Saving it after setting its values 
  @friends = Friend.where(:circle_id => @circlee.id)         # Finding Friends related to that Circle
    @friends.each do |f|
      @blocked = Blocked.new                                  #Adding it to table blocked
      @blocked.friend_id = f.id
      @blocked.circle_id= f.circle_id
      @blocked.save 
      Friend.where(:id => f.id).first.destroy                                                        #   from circles and Friends Models 
    end
     #@test = "Ana hna "
     flash[:notice] = @circlee.id
    Circle.where(:id => @circlee.id).first.destroy
  end
   redirect_to "/"
end





end
