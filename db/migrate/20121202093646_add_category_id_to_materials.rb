class AddCategoryIdToMaterials < ActiveRecord::Migration
  def change
    add_column :materials, :category_id, :integer
    add_index :materials, :category_id
  end
end
