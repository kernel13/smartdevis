class Customer < ActiveRecord::Base
  belongs_to :company
  belongs_to :estimate
  has_one :address, :as => :addressable, :dependent => :destroy
  accepts_nested_attributes_for :address, :allow_destroy => true
    
  attr_accessible :customer_name, :company_id
  attr_accessible :address_attributes
  
  
end
