class Worksite < ActiveRecord::Base
  has_many :items
  has_many :materials, :through => :item, :dependent => :destroy
  accepts_nested_attributes_for :items, :allow_destroy => true
  
  attr_accessible :description, :reason, :work_end_on, :work_start_on, :items_attributes
  
end
