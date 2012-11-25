class Address < ActiveRecord::Base
  belongs_to :addressable, :polymorphic => true  
  
  attr_accessible :address_line1, :address_line2, :city, :email, :phone, :postal_code
  
  validates :address_line1, :presence => true
  validates :city, :presence => true
  validates :postal_code, :presence => true, :numericality => true
end
