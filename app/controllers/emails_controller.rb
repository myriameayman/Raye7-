class EmailsController < ApplicationController
  before_filter :authenticate_user!
  def index
  end

  def delete
  end

  def create
    @array_emails = params[:array].split(',') 
  end

  def show
  end

  def update
  end

  def new
  end

  def add_email
  end
end
