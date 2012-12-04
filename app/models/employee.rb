class Employee < ActiveRecord::Base
  has_and_belongs_to_many :estimates
  belongs_to :company
    
  attr_accessible :day_price, :first_name, :last_name
end
