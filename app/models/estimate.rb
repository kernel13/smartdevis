class Estimate < ActiveRecord::Base
  has_and_belongs_to_many :employees
  belongs_to :customer
  belongs_to :company
  has_many :worksites
  
  accepts_nested_attributes_for :worksites, :allow_destroy => true
  
  attr_writer :customer_name
  attr_accessible :nb_days, :total, :customer_name, :customer_id, :company_id
  
  delegate :customer_name, :to => :customer, :allow_nil => true
end
