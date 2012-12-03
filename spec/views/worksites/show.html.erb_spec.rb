require 'spec_helper'

describe "worksites/show" do
  before(:each) do
    @worksite = assign(:worksite, stub_model(Worksite,
      :reason => "Reason",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Reason/)
    rendered.should match(/MyText/)
  end
end
