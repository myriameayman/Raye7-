class PlaceController < ApplicationController
  

  	def place
      @show_place = Place.find(:all)
    
   end

  end

