class Task < ApplicationRecord
  validates :name, presence: true, allow_blank: false #空欄はfalseにする
  default_scope -> { order(created_at: :desc) } # タスクを上から新しい順に並び替えてる

end
