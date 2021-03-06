class SessionsController < ApplicationController
  skip_before_action :authorize

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user.try(:authenticate, params[:password])
      session[:user_id] = user.id
      redirect_to tasks_index_path, notice: "Login successfull"
    else
      flash.now[:error] = "Wrong password or email"
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to tasks_index_path, notice: "Logged out"
  end
end
