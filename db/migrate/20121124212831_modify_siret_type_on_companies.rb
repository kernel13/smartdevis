class ModifySiretTypeOnCompanies < ActiveRecord::Migration
  def up
      remove_column :companies, :siret
      add_column :companies, :siret, :string
  end

  def down
      remove_column :companies, :siret
      add_column :companies, :siret, :integer
  end
end
