class Dashboard < ApplicationRecord
  validates :overdue, presence: true
  belongs_to :user
end
