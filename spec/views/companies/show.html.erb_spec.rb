require 'spec_helper'

describe "companies/show" do
  before(:each) do
    @company = assign(:company, stub_model(Company,
      :siret => 1,
      :name => "Name",
      :logo => "Logo"
    ))
  end

  # it "renders attributes in <p>" do
  #     render
  #     # Run the generator again with the --webrat flag if you want to use webrat matchers
  #     rendered.should match(/1/)
  #     rendered.should match(/Name/)
  #     rendered.should match(/Logo/)
  #   end
end
