require 'spec_helper'
 
describe "Companies" do
  
  before :each do
     #FactoryGirl.create(:account)
     @company = create(:company)
  end
  
  describe "GET /companies" do
      it "should display company from current user" do                             
          
          visit root_path
         
          fill_in "account_email",        :with => "stephane.sop@free.fr"
          fill_in "account_password",     :with => "ciotat13"
          
          click_on "Sign in"
          
          page.body.should have_content(@company.company_name)        
          
      end
  end
end
