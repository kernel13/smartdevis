class AddEstimateIdToWorksites < ActiveRecord::Migration
  def change
    add_column :worksites, :estimate_id, :integer
  end
end
