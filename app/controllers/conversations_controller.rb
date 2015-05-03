class ConversationsController < ApplicationController
  before_filter :authenticate_user!

  layout false

  def create
     #redirect_to url_for(:controller => "circles", :action => "index")  and return
    if Conversation.between(params[:sid],params[:rip]).present?
      @conversation = Conversation.between(params[:sid],params[:rip]).first
    else
    #@sender = params[:sid]
    #@reciever = params[:rip]
    #@conversation = Conversation.new
    #@conversation.save
    #@conversation.recipient_id = @reciever
    #@conversation.sender_id = @sender
    #@conversation.save
    #@id = @conversation.id
      @conversation = Conversation.create!(conversation_params)
    end
    redirect_to url_for(:controller => "conversations", :action => "show", :id => @conversation.id)  and return
    #render json: { conversation_id: @conversation.id }
    #redirect_to url_for(:controller => "conversations", :action => "show", :id => @conversation.id)  and return
  end

  def show
    #flash[:notice] = "ana hna "
    #redirect_to url_for(:controller => "circles", :action => "show") and return 
    @conversation = Conversation.find(params[:id])
    @reciever = interlocutor(@conversation)
    #flash[:notice] = @reciever.name
    @messages = @conversation.messages
    @message = Message.new

  end

  private
  #def conversation_params
   # params.permit(:sender_id, :recipient_id)
  #end

  def interlocutor(conversation)
    current_user == conversation.recipient ? conversation.sender : conversation.recipient
  end
end
