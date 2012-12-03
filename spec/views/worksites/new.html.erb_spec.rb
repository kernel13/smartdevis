require 'spec_helper'

describe "worksites/new" do
  before(:each) do
    assign(:worksite, stub_model(Worksite,
      :reason => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new worksite form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => worksites_path, :method => "post" do
      assert_select "input#worksite_reason", :name => "worksite[reason]"
      assert_select "textarea#worksite_description", :name => "worksite[description]"
    end
  end
end
