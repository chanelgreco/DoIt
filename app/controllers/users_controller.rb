class UsersController < ApplicationController
  skip_before_action :authorize, only: [:new, :create]

  # GET /users/1
  # GET /users/1.json
  def show
    @user = set_user
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = set_user
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        UserMailer.welcome_email(@user).deliver_now
        format.html { redirect_to tasks_index_path, notice: 'User was successfully created. Please log in.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    set_user
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    set_user
    if @user == current_user
      @user.destroy
      respond_to do |format|
        format.html { redirect_to logout_url, notice: 'User was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to tasks_index_url, notice: "You can't delete other users." }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
