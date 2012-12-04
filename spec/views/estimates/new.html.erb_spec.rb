require 'spec_helper'

describe "estimates/new" do
  before(:each) do
    assign(:estimate, stub_model(Estimate,
      :total => "9.99",
      :nb_days => 1
    ).as_new_record)
  end

  it "renders new estimate form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => estimates_path, :method => "post" do
      assert_select "input#estimate_total", :name => "estimate[total]"
      assert_select "input#estimate_nb_days", :name => "estimate[nb_days]"
    end
  end
end
