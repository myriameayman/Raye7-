class CirclesController < ApplicationController
	before_filter :authenticate_user!
  def index
  end

  def show
  	@circle = Circle.find(params[:id])
  end

  def create
  end

  def delete
  end
end
