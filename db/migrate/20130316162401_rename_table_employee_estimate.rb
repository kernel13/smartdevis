class RenameTableEmployeeEstimate < ActiveRecord::Migration
  def up
  	rename_table :employees_estimates, :employees_statements
  end

  def down
  	rename_table :employees_statements, :employees_estimates
  end
end
