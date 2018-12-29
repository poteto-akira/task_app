class Task < ApplicationRecord
  validates :name, presence: true, allow_blank: false #空欄はfalseにする
  validates :content, length: { maximum: 300 }
  validates :current_task_id, presence: true, length: { maximum: 3 }, length: { minimum: 0 }
  validates :user_id, presence: true
  default_scope -> { order(created_at: :desc) } # タスクを上から新しい順に並び替えてる
  belongs_to :user

end
