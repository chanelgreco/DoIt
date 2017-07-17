class Dashboard < ApplicationRecord
  validates :overdue, inclusion: { in: [true, false] }
  belongs_to :user


end
