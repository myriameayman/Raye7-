class FriendsController < ApplicationController
  def index
  	@friend = Friend.all
  end
  def show
  	unless(params[:search==nil])
      @friend = Friend.search(params[:search])
    end
  end
end
