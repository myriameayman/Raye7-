class EmailsController < ApplicationController
  before_filter :authenticate_user!
  def index
  end

  def delete
  end

  def create
    @user = current_user
    @array_emails = params[:array].split(',')
    @array_emails.each do |grant|
      MyMailer.add_email(@user,grant).deliver  
    end
    redirect_to url_for(:controller => "profiles", :action => "myAccount") and return
  end
  
  def verify 
    @email = params[:email]
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
