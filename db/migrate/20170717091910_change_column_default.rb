class ChangeColumnDefault < ActiveRecord::Migration[5.0]
  def change
    change_column_default :dashboards, :overdue, true
  end
end
