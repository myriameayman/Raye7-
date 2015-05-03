class TagsController < ApplicationController
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
	     end
     end

end

def index 
	@tags=Tag.all
end
end