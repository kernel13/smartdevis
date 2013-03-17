class RenameTableEstimate < ActiveRecord::Migration
  def up
  	rename_table :estimates, :statements
  end

  def down
  	rename_table :statements, :estimates
  end
end
