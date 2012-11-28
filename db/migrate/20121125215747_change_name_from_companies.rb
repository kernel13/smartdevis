class ChangeNameFromCompanies < ActiveRecord::Migration
  def up
      remove_column :companies, :name
      add_column :companies, :company_name, :string
  end

  def down
      remove_column :companies, :company_name
      add_column :companies, :name, :string
  end
end
