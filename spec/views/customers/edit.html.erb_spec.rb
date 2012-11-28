require 'spec_helper'

describe "customers/edit" do
  before(:each) do
    @customer = assign(:customer, stub_model(Customer,
      :last_name => "MyString",
      :first_name => "MyString"
    ))
  end

  it "renders the edit customer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => customers_path(@customer), :method => "post" do
      assert_select "input#customer_last_name", :name => "customer[last_name]"
      assert_select "input#customer_first_name", :name => "customer[first_name]"
    end
  end
end
