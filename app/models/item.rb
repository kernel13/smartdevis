class Item < ActiveRecord::Base
  attr_accessible :quantity, :totalTF, :tva, :material_id
  attr_accessor :material
end
