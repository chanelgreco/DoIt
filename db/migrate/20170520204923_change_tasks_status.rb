class ChangeTasksStatus < ActiveRecord::Migration[5.0]
  def change
    change_column :tasks, :status, :integer
  end
end
