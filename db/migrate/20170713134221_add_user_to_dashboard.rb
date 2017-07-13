class AddUserToDashboard < ActiveRecord::Migration[5.0]
  def change
    add_reference :dashboards, :user, foreign_key: true
  end
end
