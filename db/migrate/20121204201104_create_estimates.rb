class CreateEstimates < ActiveRecord::Migration
  def change
    create_table :estimates do |t|
      t.decimal :total
      t.integer :nb_days

      t.timestamps
    end
  end
end
