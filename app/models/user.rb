class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true, format: { with: /\A[a-z0-9]+\z/i }, allow_blank: false
  validates :password, presence: true, length: { minimum: 6 }, allow_blank: false
  has_secure_password

 # 渡された文字列のハッシュ値を返す
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                              BCrypt::Engine.cost
    BCrypt::Paword.create(string, cost: cost)
  end

end
