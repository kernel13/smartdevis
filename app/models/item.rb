class Item < ActiveRecord::Base
  belongs_to :material
  belongs_to :worksite
  
  attr_accessible :quantity, :totalTF, :tva, :material_id, :worksite_id, :current_material, :name
  attr_accessor :name

  delegate :name, :to => :material, :allow_nil => true
end
