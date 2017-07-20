class Task < ApplicationRecord
  validates :title, :description, :priority, :status, presence: true
  belongs_to :user

  STATUS_TODO = 0
  STATUS_DOING = 1
  STATUS_DONE = 2

  enum priority: {
    "Critical" => 0,
    "Important" => 1,
    "Normal" => 2,
    "Low" => 3
  }

  enum status: {
    "To do" => STATUS_TODO,
    "Doing it..." => STATUS_DOING,
    "Done!" => STATUS_DONE
  }


  # Scope to show the tasks filtered by their status.
  scope :todo, -> { where(status: STATUS_TODO).order(:due_date) }
  scope :doing, -> { where(status: STATUS_DOING).order(:due_date) }
  scope :done, -> { where(status: STATUS_DONE).order(:due_date) }

  # Scope to show the tasks with the status todo and Doing
  scope :todo_doing, -> { where(status: [STATUS_TODO, STATUS_DOING])}

  # Scope to show overdue tasks with the status "To do" or "Doing it..."
  scope :overdue, -> { todo_doing.where("due_date <= ?", Date.today ).order(:due_date) }

  # Scope to show upcoming tasks with the status "To do" or "Doing it..."
  scope :upcoming, -> { todo_doing.where(due_date: (Date.current)..Date.current+7).order(:due_date).limit(6) }

  # Method to check if task is overdue
  def overdue?
    if self.try(:due_date)
      self.due_date <= Date.today
    end
  end


end
