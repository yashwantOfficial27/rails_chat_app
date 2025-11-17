# app/controllers/messages_controller.rb
class MessagesController < ApplicationController
  before_action :require_login
  
  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    @message.user = current_user
    
    if @message.save
      # Turbo will handle the broadcast via after_create_commit
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to @room }
      end
    else
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace("message_form", 
                                                    partial: "messages/form", 
                                                    locals: { message: @message, room: @room }) }
        format.html { redirect_to @room, alert: "Message failed to send" }
      end
    end
  end
  
  def destroy
    @message = Message.find(params[:id])
    @room = @message.room
    
    if @message.user == current_user
      @message.destroy
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to @room, notice: "Message deleted" }
      end
    else
      redirect_to @room, alert: "You can only delete your own messages"
    end
  end
  
  private
  
  def message_params
    params.require(:message).permit(:content)
  end
end