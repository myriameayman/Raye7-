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
end
