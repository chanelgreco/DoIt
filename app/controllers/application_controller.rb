class ApplicationController < ActionController::Base
  before_action :authorize
  protect_from_forgery with: :exception

  protected
  # Make sure that a user is logged in before any tasks get displayd
  def authorize
    unless User.find_by(id: session[:user_id])
      redirect_to tasks_index_path, notice: "Please log in"
    end
  end

  private
  # Helper to display the current logged in user
  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user
end
