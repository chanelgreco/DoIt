class Dashboard < ApplicationRecord
  validates :overdue, presence: true
  belongs_to :user
end

def initial_dashboard
  # if user doesn't have an associated dashboard yet, create one
  unless current_user.dashboard
    current_user.dashboard
  end
end
