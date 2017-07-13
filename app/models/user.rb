class User < ApplicationRecord
  validates :name, :email, presence: true
  validates :email, uniqueness: true
  has_secure_password
  has_many :tasks, dependent: :destroy
  has_one :dashboard

  def self.name_email_2(user)
    user.name_email
  end

  def name_email
    name + email
  end
end
