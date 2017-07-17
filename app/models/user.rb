class User < ApplicationRecord
  validates :name, :email, presence: true
  validates :email, uniqueness: true
  has_secure_password
  has_many :tasks, dependent: :destroy
  has_one :dashboard, dependent: :destroy

  before_create :initialize_dashboard

  def initialize_dashboard
    return if dashboard.present?
    self.dashboard = Dashboard.new(user: self)
  end

  def self.name_email_2(user)
    user.name_email
  end

  def name_email
    name + email
  end
end
