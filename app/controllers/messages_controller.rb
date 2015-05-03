class MessagesController < ApplicationController
  before_filter :authenticate_user!
 
  def create
    #redirect_to url_for(:controller => "circles", :action => "index")  and return
    @conversation = Conversation.find(params[:conv_id])
   # @message = @conversation.messages.build(message_params)
    @message = Message.new
    @message.body =params[:body]
    @message.user_id = current_user.id
    @message.conversation_id = params[:conv_id]
    @message.save!
  
    @path = conversation_path(@conversation)
    redirect_to url_for(:controller => "conversations", :action => "show", :id => params[:conv_id] )  and return
  end
 
  #private
 
  #def message_params
   # params.require(:message).permit(:body)
  #end
end