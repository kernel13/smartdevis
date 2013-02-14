class Worksite < ActiveRecord::Base 
  has_many :items
  has_many :materials, :through => :items, :dependent => :destroy
  belongs_to :estimate
  
  accepts_nested_attributes_for :items, :allow_destroy => true
  attr_accessible :estimate_id, :description, :reason, :work_end_on, :work_start_on, :items_attributes
  
end
