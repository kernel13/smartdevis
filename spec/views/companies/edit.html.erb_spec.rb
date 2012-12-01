require 'spec_helper'

describe "companies/edit" do
  before(:each) do
    @company = assign(:company, stub_model(Company,
      :siret => 1,
      :name => "MyString",
      :logo => "MyString"
    ))
  end

  # it "renders the edit company form" do
  #    render
  # 
  #    # Run the generator again with the --webrat flag if you want to use webrat matchers
  #    assert_select "form", :action => companies_path(@company), :method => "post" do
  #      assert_select "input#company_siret", :name => "company[siret]"
  #      assert_select "input#company_name", :name => "company[company_name]"
  #      assert_select "input#company_logo", :name => "company[logo]"
  #    end
  #  end
end
