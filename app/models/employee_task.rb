class EmployeeTask < ActiveRecord::Base
  belongs_to :employee
  belongs_to :worksite

  attr_accessible :employee_id, :price, :worksite_id, :name, :nb_day, :half_day


  delegate :name=, :to => :employee, :allow_nil => true
  delegate :name, :to => :employee, :allow_nil => true

  def total
  		t = ((self.price || 0) * (self.nb_day || 0))
  		t = t /2 if self.half_day
  		t
  end
end
