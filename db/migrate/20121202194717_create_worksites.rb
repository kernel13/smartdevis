class CreateWorksites < ActiveRecord::Migration
  def change
    create_table :worksites do |t|
      t.string :reason
      t.text :description
      t.date :work_start_on
      t.date :work_end_on

      t.timestamps
    end
  end
end
