class FeedbackController < ApplicationController
  before_filter :authenticate_user!

  def index

  end
  
  def create
    @user = current_user
    @title = params[:title]
    @message = params[:message]
    MyMailer.send_feedback(@user,@title,@message).deliver
    MyMaile.send_feedback_to_user(@user,@title,@message).deliver
    redirect_to root_path
  
  end

end
