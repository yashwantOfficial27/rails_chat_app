class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?
  
  private
  
  # Get current logged-in user
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  
  # Check if user is logged in
  def logged_in?
    current_user.present?
  end
  
  # Require login for certain pages
  def require_login
    unless logged_in?
      flash[:alert] = "You must be logged in to access this page"
      redirect_to login_path
    end
  end
end