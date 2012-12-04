require 'spec_helper'

describe "estimates/index" do
  before(:each) do
    assign(:estimates, [
      stub_model(Estimate,
        :total => "9.99",
        :nb_days => 1
      ),
      stub_model(Estimate,
        :total => "9.99",
        :nb_days => 1
      )
    ])
  end

  it "renders a list of estimates" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
