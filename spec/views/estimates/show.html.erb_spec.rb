require 'spec_helper'

describe "estimates/show" do
  before(:each) do
    @resource = assign(:estimate, stub_model(Estimate,
      :total => "9.99",
      :nb_days => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/9.99/)
    rendered.should match(/1/)
  end
end
