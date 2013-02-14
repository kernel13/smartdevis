class Material < ActiveRecord::Base
  belongs_to :category
  has_many :items
  has_many :worksites, :through => :items, :dependent => :destroy
  
  attr_accessible :name, :unit_priceTF, :category_id
end
