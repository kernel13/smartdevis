class Employee < ActiveRecord::Base
  belongs_to :company
    
  attr_accessible :day_price, :first_name, :last_name
end
