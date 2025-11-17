# app/controllers/users_controller.rb
class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome to Chat Rails, #{@user.username}!"
      redirect_to rooms_path
    else
      flash.now[:alert] = "Signup failed"
      render :new, status: :unprocessable_entity
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end