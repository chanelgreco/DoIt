class Task < ApplicationRecord
  validates :title, :description, :priority, :status, presence: true
  
  enum priority: {
    "Critical" => 0,
    "Important" => 1,
    "Normal" => 2,
    "Low" => 3
  }

  enum status: {
    "To do" => 0,
    "Doing it" => 1,
    "Done!" => 2
  }
end
