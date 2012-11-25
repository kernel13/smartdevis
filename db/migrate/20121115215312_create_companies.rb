class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.integer :siret
      t.string :name
      t.string :logo

      t.timestamps
    end
  end
end
