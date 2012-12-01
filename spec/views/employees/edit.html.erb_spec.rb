require 'spec_helper'

describe "employees/edit" do
  before(:each) do
    @employee = assign(:employee, stub_model(Employee,
      :last_name => "MyString",
      :first_name => "MyString",
      :day_price => "9.99"
    ))
  end

  # it "renders the edit employee form" do
  #     render
  # 
  #     # Run the generator again with the --webrat flag if you want to use webrat matchers
  #     assert_select "form", :action => employees_path(@employee), :method => "post" do
  #       assert_select "input#employee_last_name", :name => "employee[last_name]"
  #       assert_select "input#employee_first_name", :name => "employee[first_name]"
  #       assert_select "input#employee_day_price", :name => "employee[day_price]"
  #     end
  #   end
end
