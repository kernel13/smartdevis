require 'spec_helper'

describe "materials/show" do
  before(:each) do
    @material = assign(:material, stub_model(Material,
      :name => "Name",
      :unit_priceTF => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/9.99/)
  end
end
