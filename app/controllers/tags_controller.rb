class TagsController < ApplicationController
# Inserting into tag requires to splot array received from text field.
# Then adding current user and target user as User_id into model.
# The text field in tag model is current_user has tagged you in request name.
# Done by @Renad.
def create
	  unless(params[:id]==nil)
		@id=current_user.id
		@tag=Tag.new
		@not=Notification.new
		 unless(params[:tagList]==nil)
		   @tag.request_id=params[:id]
		   @tag.current_user=@id
		   @not.notifying=@id

		   usernames = params[:tagList].split(/,/)
		   usernames.each do |grant|
		     @users=User.find(:all,:conditions =>['username LIKE ?', grant])
		     @request=Request.find(params[:id])
		     @users.each do |user|
			   @tag.user_id=user.id
			   @not.notified=user.id
			   @not.text=grant +" has tagged you in" + @request.name
		      end
		   end
			  @tag.save
              @not.save
              redirect_to '/'
	     end
     end
 end


# Returns all tags done by Renad.
def index 
	@tags=Tag.all
end
end