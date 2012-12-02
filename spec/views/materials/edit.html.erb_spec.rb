require 'spec_helper'

describe "materials/edit" do
  before(:each) do
    @material = assign(:material, stub_model(Material,
      :name => "MyString",
      :unit_priceTF => "9.99"
    ))
  end

  it "renders the edit material form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => materials_path(@material), :method => "post" do
      assert_select "input#material_name", :name => "material[name]"
      assert_select "input#material_unit_priceTF", :name => "material[unit_priceTF]"
    end
  end
end
