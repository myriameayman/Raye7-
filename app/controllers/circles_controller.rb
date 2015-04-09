class CirclesController < ApplicationController
	before_filter :authenticate_user!
  def index
  end

  def show
  	@user = current_user
<<<<<<< HEAD
=======

>>>>>>> 4ee8616d3e321fe640c56ced20af84c3ec1304c8
  	if (Circle.exists?(params[:id]))
  		@circle = Circle.find(params[:id])
  		unless(@user.circles.exists?(@circle))
  			redirect_to "/"
  		end
<<<<<<< HEAD
=======

>>>>>>> 4ee8616d3e321fe640c56ced20af84c3ec1304c8
  	else
  		redirect_to "/"
  	end

  end

  def create
  end

  def delete
  end
end
