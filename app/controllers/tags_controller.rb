class TagsController < ApplicationController
	def create
	  unless(params[:id]==nil)
		@id=current_user.id
		@tag=Tag.new
		 unless(params[:tagList]==nil)
		   @tag.request_id=params[:id]
		   @tag.current_user=@id
		   result = params[:tagList].split(/,/)
		      result.each do |grant|
		      	@user=User.find(:all , :conditions => ['username LIKE ?', params[:tagList] ])
		      	  @user.each do |user|
				   @tag.user_id=user.id
				  end
			  end
	     end
     end
@tag.save
end
end