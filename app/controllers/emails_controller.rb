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
    @user = current_user
    @add_email = params[:email]
    @divisons = @add_email.split('@')
    @divisons = @divisons[1]
    @divisons = @divisons.split('.')
    if(@divisons[1]=='com')
      @divisons = @divisons[0]
    else
      @divisons = @divisons[1]
    end
    @email = Email.new
    @email.user_id = @user.id
    @email.email = @add_email
    @email.save

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
