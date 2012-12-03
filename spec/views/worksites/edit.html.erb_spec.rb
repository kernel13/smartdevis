require 'spec_helper'

describe "worksites/edit" do
  before(:each) do
    @worksite = assign(:worksite, stub_model(Worksite,
      :reason => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit worksite form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => worksites_path(@worksite), :method => "post" do
      assert_select "input#worksite_reason", :name => "worksite[reason]"
      assert_select "textarea#worksite_description", :name => "worksite[description]"
    end
  end
end
