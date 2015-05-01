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
    if(@divisons == 'facebook' or @divisons =='gmail' or @divisons == 'twitter')
      return
    end
    unless(@user.circles.exists?(:name => @divisons))
      @circle = Circle.new
      @circle.user_id = @user.id
      @circle.name = @divisons
      @circle.save
    end
    @circle = nil
    @user.circles.each do |c|
      if(c.name == @divisons)
        @circle = c
        break
      end
    end
    if(@circle == nil)
      return
    end
    @x = User.all
    @x.each do |u|
      if(u.circles.exists?(:name => @divisons))
        # Adding all users belonging to that circle to the user friends.
        unless(u.id==@user.id)
          friend = Friend.new 
          friend.circle_id = @circle.id   
          friend.name = u.name
          friend.app_id = u.id
          friend.save
          # Now add the user to the friend circle. 
          u.circles.each do |grant|
            if(grant == @divisons)
              friend_me = Friend.new
              friend_me.circle_id = grant.id
              friend_me.name = @user.name
              friend_me.app_id = @user.id
              friend_me.save
            end
          end 
        end
      end
    end
    redirect_to url_for(:controller => "profiles", :action => "myAccount") and return
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
