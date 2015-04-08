class PagesController < ApplicationController
  def new 
  page = Page.new 
  end 
  def create 
   page = Page.new   # should be removed later 
   @latitude = params[:latitude]
   @longitude = params[:longitude]
   page.lat = @latitude 
   page.long = @longitude 
   page.save
  end
  def home

  end
   
  
  def reverse_geocoding
    respond_to do |format|               
      format.js
              end
  end


end 