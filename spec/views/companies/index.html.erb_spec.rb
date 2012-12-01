require 'spec_helper'

describe "companies/index" do
  before(:each) do
    assign(:companies, [
      stub_model(Company,
        :siret => 1,
        :name => "Name",
        :logo => "Logo"
      ),
      stub_model(Company,
        :siret => 1,
        :name => "Name",
        :logo => "Logo"
      )
    ])
  end

  # it "renders a list of companies" do
  #    render
  #    # Run the generator again with the --webrat flag if you want to use webrat matchers
  #    assert_select "tr>td", :text => 1.to_s, :count => 2
  #    assert_select "tr>td", :text => "Name".to_s, :count => 2
  #    assert_select "tr>td", :text => "Logo".to_s, :count => 2
  #  end
end
