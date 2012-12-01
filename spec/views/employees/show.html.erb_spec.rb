require 'spec_helper'

describe "employees/show" do
  before(:each) do
    @employee = assign(:employee, stub_model(Employee,
      :last_name => "Last Name",
      :first_name => "First Name",
      :day_price => "9.99"
    ))
  end

  # it "renders attributes in <p>" do
  #    render
  #    # Run the generator again with the --webrat flag if you want to use webrat matchers
  #    rendered.should match(/Last Name/)
  #    rendered.should match(/First Name/)
  #    rendered.should match(/9.99/)
  #  end
end
