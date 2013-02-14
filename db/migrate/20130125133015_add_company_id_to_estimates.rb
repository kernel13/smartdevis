class AddCompanyIdToEstimates < ActiveRecord::Migration
  def change
    add_column :estimates, :company_id, :integer
  end
end
