class Task < ApplicationRecord
  validates :title, :description, :priority, :status, presence: true
  belongs_to :user

  enum priority: {
    "Critical" => 0,
    "Important" => 1,
    "Normal" => 2,
    "Low" => 3
  }

  enum status: {
    "To do" => 0,
    "Doing it..." => 1,
    "Done!" => 2
  }


  # Scope to show the tasks filtered by their status.
  scope :todo, -> { where(status: 0).order(:due_date) }
  scope :doing, -> { where(status: 1).order(:due_date) }
  scope :done, -> { where(status: 2).order(:due_date) }

  # Scope to show overdue tasks
  scope :overdue, -> { where("due_date <= ?", Date.today ).order(:due_date) }

  # Method to check if task is overdue
  def overdue?
    self.due_date <= Date.today
  end

end
