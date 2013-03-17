class RenameColumnEstimateIdFromWorksites < ActiveRecord::Migration
  def up
  	rename_column :worksites, :estimate_id, :statement_id
  end

  def down
  	rename_column :workisites, :statement_id, :estimate_id
  end
end
