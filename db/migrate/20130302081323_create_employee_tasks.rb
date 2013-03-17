class CreateEmployeeTasks < ActiveRecord::Migration
  def change
    create_table :employee_tasks do |t|
      t.integer :employee_id
      t.integer :worksite_id
      t.decimal :price

      t.timestamps
    end

    add_index :employee_tasks, [:employee_id, :worksite_id]
  end
end
