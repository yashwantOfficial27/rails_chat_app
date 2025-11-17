# app/controllers/rooms_controller.rb
class RoomsController < ApplicationController
  before_action :require_login
  
  def index
    @rooms = Room.all.order(created_at: :desc)
  end
  
  def show
    @room = Room.find(params[:id])
    @messages = @room.messages.includes(:user).order(created_at: :asc)
    @message = Message.new
  end
  
  def new
    @room = Room.new
  end
  
  def create
    @room = Room.new(room_params)
    
    if @room.save
      flash[:notice] = "Room created successfully!"
      redirect_to @room
    else
      flash.now[:alert] = "Failed to create room"
      render :new, status: :unprocessable_entity
    end
  end
  
  private
  
  def room_params
    params.require(:room).permit(:name, :description)
  end
end