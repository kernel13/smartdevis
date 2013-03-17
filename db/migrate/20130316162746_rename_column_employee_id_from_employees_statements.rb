class RenameColumnEmployeeIdFromEmployeesStatements < ActiveRecord::Migration
  def up
  	rename_column :employees_statements, :estimate_id, :statement_id
  end

  def down
  	rename_column :employees_statements, :statement_id, :estimate_id
  end
end
