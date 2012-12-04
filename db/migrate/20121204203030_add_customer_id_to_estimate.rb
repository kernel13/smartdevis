class AddCustomerIdToEstimate < ActiveRecord::Migration
  def change
    add_column :estimates, :customer_id, :integer
  end
end
