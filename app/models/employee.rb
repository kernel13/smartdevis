class Employee < ActiveRecord::Base
  has_many :worksites, :through => :employee_tasks
  belongs_to :company
    
  attr_accessible :day_price, :first_name, :last_name
  
  validates :last_name, :first_name, :day_price, :presence => true
  

  def name=(value)
  	self.first_name = value.split(" ").first
  	self.last_name = value.split(" ").last
  end

  def name
  		self.first_name + " " + self.last_name
  end
end
