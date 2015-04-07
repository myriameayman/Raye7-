class RequestController < ApplicationController
  def search
   @requests = Request.search(params[:search])
  end
  def show
  	 @request = Request.find(params[:request_id])
  end

def index 
  @requests = Request.search(params[:search])
 end
 
  
end