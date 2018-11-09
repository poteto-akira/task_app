class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true, format: { with: /\A[a-z0-9]+\z/i }, allow_blank: false
  validates :password, presence: true, length: { minimum: 6 }, allow_blank: false
  has_secure_password

end
