class DashboardController < ApplicationController

  # GET /dashboard
  def show
    # initial_dashboard
    set_dashboard
    @tasks_overdue = Task.overdue
  end

  # GET /dashboard/edit
  def edit
    set_dashboard
  end

  # PATCH /dashboard/update
  def update
    set_dashboard
    respond_to do |format|
      if @dashboard.update(dashboard_params)
        format.html { redirect_to dashboard_url, notice: 'Your dashboard was successfully updated.' }
        format.json { render :show, status: :ok, location: @dashboard }
      else
        format.html { render :edit }
        format.json { render json: @dashboard.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def set_dashboard
    @dashboard ||= current_user.dashboard
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def dashboard_params
    params.require(:dashboard).permit(:overdue)
  end

end
