class RequestController < ApplicationController
  def index
   @requests = Request.search(params[:search])
  end
end
