class Category < ActiveRecord::Base
  has_many :materials
  has_many :sub_categories, :class_name => "Category", :foreign_key => "parent_id", :dependent => :destroy
  belongs_to :parent, :class_name => "Category"
  
  attr_accessible :name, :parent_id
end
