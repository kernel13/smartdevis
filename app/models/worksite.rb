class Worksite < ActiveRecord::Base 
  has_many :items
  has_many :employee_tasks
  has_many :materials, :through => :items, :dependent => :destroy
  has_many :employees, :through => :employee_tasks, :dependent => :destroy
  belongs_to :estimate
  
  accepts_nested_attributes_for :employee_tasks, :allow_destroy => true
  accepts_nested_attributes_for :items, :allow_destroy => true
  
  attr_accessible :statement_id, :description, 
  					:reason, :work_end_on, :work_start_on,
  				    :items_attributes, :employee_tasks_attributes  		
  
  validates :reason, :presence => :true

  def work_start_on=(date)
    if !date.nil? && !date.empty?
      date = Date.strptime(date, '%m/%d/%Y') if date.is_a?(String)
      write_attribute(:work_start_on, date)
    end
  end

  def work_end_on=(date)
    if !date.nil? && !date.empty?
      date = Date.strptime(date, '%m/%d/%Y') if date.is_a?(String)
      write_attribute(:work_end_on, date)
    end
  end

  def totalTF
      t = 0
      self.items.each do |item|
         t += item.totalTF
      end

      self.employee_tasks.each do |employee|
          t += employee.total
      end

      t
  end

end
