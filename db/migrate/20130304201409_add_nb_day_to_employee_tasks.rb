class AddNbDayToEmployeeTasks < ActiveRecord::Migration
  def change
    add_column :employee_tasks, :nb_day, :integer
    add_column :employee_tasks, :half_day, :boolean
  end
end
