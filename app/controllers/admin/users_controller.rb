class Admin::UsersController < ApplicationController

  # GET /admin/users
  # GET /admin/users.json
  def index
    @users = User.all
  end

  # GET /admin/users/1
  # GET /admin/users/1.json
  def show
    chosen_user
  end

  # GET /admin/users/new
  def new
    @user = User.new
  end

  # GET /admin/users/1/edit
  def edit
    chosen_user
  end

  # POST /admin/users
  # POST /admin/users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to admin_users_path, notice: 'User was successfully created. Please send the users her/his credentials.' }
      else
        format.html { render :new, notice: 'Something went wrong. Please try again.' }
      end
    end
  end

  # PATCH/PUT /admin/users/1
  # PATCH/PUT /admin/users/1.json
  def update
    chosen_user
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to admin_user_path, notice: 'User was successfully updated.' }
      else
        format.html { render :edit, notice: 'Something went wrong. Please try again.'  }
      end
    end
  end

  # DELETE /admin/users/1
  # DELETE /admin/users/1.json
  def destroy
    chosen_user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_path, notice: 'User was successfully destroyed.' }
    end
  end

  private
  # Get chosen user
  def chosen_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
