class Company < ActiveRecord::Base
  has_many :accounts, :dependent => :destroy
  has_one :address, :as => :addressable, :dependent => :destroy
  
  accepts_nested_attributes_for :accounts, :allow_destroy => true
  accepts_nested_attributes_for :address, :allow_destroy => true

  attr_accessible :logo, :name, :siret
  attr_accessible :accounts_attributes
  attr_accessible :address_attributes
    
  validates :name, :presence => true
  validates :siret, :presence => true, :numericality => true, :length => {:is => 14}
  validates :address, :presence => true
#  validates :accounts, :presence => true
  
  #alias_method :address=, :address_attributes=

end
