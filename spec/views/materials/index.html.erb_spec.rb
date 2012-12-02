require 'spec_helper'

describe "materials/index" do
  before(:each) do
    assign(:materials, [
      stub_model(Material,
        :name => "Name",
        :unit_priceTF => "9.99"
      ),
      stub_model(Material,
        :name => "Name",
        :unit_priceTF => "9.99"
      )
    ])
  end

  it "renders a list of materials" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
