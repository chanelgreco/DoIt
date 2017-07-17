class TaskNull < ActiveRecord::Migration[5.0]
  def change
    change_column_null :tasks, :title, false
    change_column_null :tasks, :description, false
    change_column_null :tasks, :priority, false
    change_column_null :tasks, :status, false
  end
end
