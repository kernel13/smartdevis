class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :address_line1
      t.string :address_line2
      t.string :city
      t.integer :postal_code
      t.string :phone
      t.string :email
      t.references :addressable, :polymorphic => true
      
      t.timestamps
    end
  end
end
