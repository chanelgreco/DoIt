class User < ApplicationRecord
  validates :name, :email, presence: true
  validates :email, uniqueness: true
  has_secure_password
  has_many :tasks, dependent: :destroy

  # def name_email
  #   user = User.new
  #   return @name_email = user.name + user.email
  # end
end
