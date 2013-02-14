class RenameTableEstimatesEmployeesToEmployeesEstimate < ActiveRecord::Migration
  def up
    rename_table :estimates_employees, :employees_estimates
  end

  def down
    rename_table :employees_estimates, :estimates_employees
  end
end
