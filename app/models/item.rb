class Item < ActiveRecord::Base
  belongs_to :material
  belongs_to :worksite
  
  attr_accessible :quantity, :totalTF, :tva, :material_id, :worksite_id, :current_material, :name, :unit_priceTF
  attr_accessor :name, :unit_priceTF

  delegate :name, :to => :material, :allow_nil => true
  delegate :unit_priceTF, :to => :material, :allow_nil => true

end
