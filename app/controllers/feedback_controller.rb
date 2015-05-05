class FeedbackController < ApplicationController
  before_filter :authenticate_user!

  def index

  end
  
  def create
    @x = params[:title]
  
  end

end
