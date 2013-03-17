
class Company < ActiveRecord::Base
  mount_uploader :logo, LogoUploader
  
  has_many :accounts, :dependent => :destroy
  has_one :address, :as => :addressable, :dependent => :destroy
  has_many :employees
  has_many :customers
  has_many :estimates
  has_many :invoices
  
  accepts_nested_attributes_for :accounts, :allow_destroy => true
  accepts_nested_attributes_for :address, :allow_destroy => true

  attr_accessible :logo, :company_name, :siret
  attr_accessible :accounts_attributes
  attr_accessible :address_attributes
  attr_accessible :remove_logo
    
  validates :company_name, :presence => true
  validates :siret, :presence => true, :numericality => true, :length => {:is => 14}
  validates :address, :presence => true  
  
end
