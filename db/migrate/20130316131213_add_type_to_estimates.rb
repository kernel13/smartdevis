class AddTypeToEstimates < ActiveRecord::Migration
  def change
    add_column :estimates, :type, :string
  end
end
