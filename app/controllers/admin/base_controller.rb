class Admin::BaseController < ApplicationController
before_action :require_admin

  def index
    @users = User.all
  end

end

  private

  # Check if the current user is an admin. If not, redirect them to the task index page
  def require_admin
    unless current_user.admin?
      redirect_to tasks_index_path, notice: "You do not have the needed permission to access."
    end
  end
