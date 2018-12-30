class RemoveDeadlineAtFromTasks < ActiveRecord::Migration[5.2]
  def change
    remove_column :tasks, :deadline_at, :datetime
  end
end
