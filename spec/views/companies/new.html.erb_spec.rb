require 'spec_helper'

describe "companies/new" do
  before(:each) do
    assign(:company, stub_model(Company,
      :siret => 1,
      :name => "MyString",
      :logo => "MyString"
    ).as_new_record)
  end

  # it "renders new company form" do
  #     render
  # 
  #     # Run the generator again with the --webrat flag if you want to use webrat matchers
  #     assert_select "form", :action => companies_path, :method => "post" do
  #       assert_select "input#company_siret", :name => "company[siret]"
  #       assert_select "input#company_name", :name => "company[name]"
  #       assert_select "input#company_logo", :name => "company[logo]"
  #     end
  #   end
end
