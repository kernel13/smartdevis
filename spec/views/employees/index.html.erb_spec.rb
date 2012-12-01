require 'spec_helper'

describe "employees/index" do
  before(:each) do
    assign(:employees, [
      stub_model(Employee,
        :last_name => "Last Name",
        :first_name => "First Name",
        :day_price => "9.99"
      ),
      stub_model(Employee,
        :last_name => "Last Name",
        :first_name => "First Name",
        :day_price => "9.99"
      )
    ])
  end

  # it "renders a list of employees" do
  #     render
  #     # Run the generator again with the --webrat flag if you want to use webrat matchers
  #     assert_select "tr>td", :text => "Last Name".to_s, :count => 2
  #     assert_select "tr>td", :text => "First Name".to_s, :count => 2
  #     assert_select "tr>td", :text => "9.99".to_s, :count => 2
  #   end
end
