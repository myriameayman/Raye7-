class FriendsController < ApplicationController

  # index uses the method search that searches for a specific friend
  def index
    unless(params[:search==nil])
      @friend = Friend.search(params[:search])
    end
  end
  # show also gets a specific friend
  def show
  	unless(params[:search==nil])
      @friend = Friend.search(params[:search])
    end
  end
end
