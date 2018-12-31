class RenameCurrentTaskIdToCurrentState < ActiveRecord::Migration[5.2]
  def change
    rename_column :tasks, :current_state, :current_state
  end
end
