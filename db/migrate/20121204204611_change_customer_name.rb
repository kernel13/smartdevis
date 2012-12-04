class ChangeCustomerName < ActiveRecord::Migration
  def up
    remove_column :customers, :first_name
    remove_column :customers, :last_name
    add_column :customers, :customer_name, :string
  end

  def down
    remove_column :customers, :customer_name
    add_column :customers, :last_name, :string
    add_column :customers, :first_name, :string
  end
end
