class CreateDashboards < ActiveRecord::Migration[5.0]
  def change
    create_table :dashboards do |t|
      t.boolean :overdue, null: false

      t.timestamps
    end
  end
end
