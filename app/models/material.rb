class Material < ActiveRecord::Base
  belongs_to :category
  attr_accessible :name, :unit_priceTF, :category_id
end
