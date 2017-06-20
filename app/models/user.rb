class User < ApplicationRecord
  validates :name, :email, presence: true
  validates :email, uniqueness: true
  has_secure_password
  has_many :tasks, dependent: :destroy
end
