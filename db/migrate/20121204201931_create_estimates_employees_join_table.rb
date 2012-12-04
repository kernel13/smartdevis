class CreateEstimatesEmployeesJoinTable < ActiveRecord::Migration
  def up
    create_table :estimates_employees, :id => false do |t|
      t.integer :estimate_id
      t.integer :employee_id
    end
  end

  def down
    drop_table :estimates_employees
  end
end
