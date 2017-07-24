class Admin::BaseController < ApplicationController
before_action :require_admin

  def index
    @users = User.all
  end

  private

  def require_admin
    unless current_user.admin?
      redirect_to tasks_index_path, notice: "You can not access the Administration interface"
    end
  end
end
