class Dashboard < ApplicationRecord
  validates :overdue, inclusion: { in: [true, false] } 
  belongs_to :user

  def initial_dashboard
    # if user doesn't have an associated dashboard yet, create one
    unless current_user.dashboard
      current_user.dashboard
    end
  end

end
