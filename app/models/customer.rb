class Customer < ActiveRecord::Base
  belongs_to :company
  has_many :estimates
  has_many :invoices
  has_one :address, :as => :addressable, :dependent => :destroy
  accepts_nested_attributes_for :address, :allow_destroy => true
    
  attr_accessible :customer_name, :company_id
  attr_accessible :address_attributes
  
  
  validates :customer_name, :presence => true
  validates :customer_name, :uniqueness => true

end
