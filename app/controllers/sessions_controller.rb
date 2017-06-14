class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user.try(:authenticate, params[:password])
      session[:user_id] = user.id
      redirect_to tasks_index_path
    else
      redirect_to login_url, alert: "Invalid user and password combination"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to tasks_index, notice: "Logged out"
  end
end
