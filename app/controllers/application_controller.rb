class ApplicationController < ActionController::Base
  before_action :authorize
  protect_from_forgery with: :exception

  protected
  # Make sure that a user is logged in before any tasks can be created
  def authorize
    unless User.find_by(id: session[:user_id])
      redirect_to tasks_index_path, notice: "Please log in"
    end
  end

  # Check if the current user is an admin. If not, redirect them to the task index page
  def require_admin
    unless current_user.admin?
      redirect_to tasks_index_path, notice: "You can not access the Administration interface"
    end
  end

  private
  # Helper to display the current logged in user
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  rescue ActiveRecord::RecordNotFound
    session.clear
  end

  helper_method :current_user
end
