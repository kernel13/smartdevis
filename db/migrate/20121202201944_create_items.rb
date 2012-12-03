class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :quantity
      t.decimal :totalTF
      t.decimal :tva
      t.integer :material_id
      t.integer :worksite_id
      
      t.timestamps
    end
  end
end
