class FriendsController < ApplicationController
  def index
  	unless(params[:search==nil])
      @friend = Friend.search(params[:search])
    end
  end
  def show
  	unless(params[:search==nil])
      @friend = Friend.search(params[:search])
    end
  end
end
