class RequestsController < ApplicationController
 def search
   @requests = Request.search(params[:search])
  end
  def show
  	  	@user = current_user
  	  	@id = params[:id]
  	if (Request.exists?(@id))
  		@request = Request.find(@id)

  	else
  		redirect_to "/"
  	end
  	
  end

def index 
	unless(params[:search==nil])
  @requests = Request.search(params[:search])
end
 end
 
end
