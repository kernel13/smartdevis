require 'spec_helper'

describe Address do
  before do
    @invalid_address = Address.new
  end
  
  it "should have one error on address line 1 if empty" do
       @invalid_address.should have_at_least(1).error_on(:address_line1)
  end
  
   it "should have one error on city" do
       @invalid_address.should have_at_least(1).error_on(:city) 
   end
   
   describe "postal code" do
     it "should have one error on postal if empty" do
          @invalid_address.should have_at_least(1).error_on(:postal_code)
     end
    
     it "should have one error on postal code if not a number" do
         invalid_address = Address.new(:address_line1 => "line", :city => "city", :postal_code => "a")
         invalid_address.errors_on(:postal_code).should include("N'est pas un nombre")
     end
   end
end
