class AdminController < ApplicationController

  # GET /admin
  def index
    @users = User.all
  end
end
