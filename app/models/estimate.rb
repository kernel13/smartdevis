class Estimate < ActiveRecord::Base
  has_and_belongs_to_many :employees
  has_one :customer
  
  attr_accessible :nb_days, :total
  
  delegate :customer_name, :to => :customer, :allow_nil => true
end
