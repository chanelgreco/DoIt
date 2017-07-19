class TasksChangeTypeStatus < ActiveRecord::Migration[5.0]
  def change
    change_column :tasks, :status, "integer using status::integer"
  end
end
