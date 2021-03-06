class User < ApplicationRecord
  attr_accessor :remember_token
  validates :username, presence: true, uniqueness: true, format: { with: /\A[a-z0-9]+\z/i }, allow_blank: false
  validates :password, presence: true, length: { minimum: 6 }, allow_blank: false
  has_secure_password
  has_many :tasks, dependent: :destroy

 # 渡された文字列のハッシュ値を返す
  def User.digest(string)
   cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                 BCrypt::Engine.cost
   BCrypt::Password.create(string, cost: cost)
  end

 #ランダムなトークンを返す
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  #永続セッションのためにユーザーをデータベースに記憶する
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token)) # remember_digestカラムをremember_tokenで更新
  end

  #渡されたトークンはダイジェストと一致したらtrueを返す
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  #ユーザーのログイン情報を破棄する
  def forget
    update_attribute(:remember_digest, nil) # remember_digestカラムをnilに更新
  end

  # 施策feedの定義
  # 完全な実装は次章
  def feed
    Task.where("user_id=?", id)
  end

end
