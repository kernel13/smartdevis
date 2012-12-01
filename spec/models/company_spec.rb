require 'spec_helper'

describe Company do
  describe "with valid attribute" do
    it "should be valid"
  end
  
  describe "with invalid attribute" do
    before(:each) do
      @company = Company.new
    end
    
    it "should fail with no name" do
       @company.should have_at_least(1).error_on(:company_name)
    end
        
    describe "siret" do         
      it "should fail with empty siret" do
         @company.should have_at_least(1).error_on(:siret)
      end
      
      it "should fail with siret length less than 14" do      
         @company.siret = "1"
         @company.errors_on(:siret).should include("longueur invalide (devrait etre de 14 caracteres)")
      end
    end
  end
  
  describe "with address" do
     it "should have an address" do
        company = create(:company)
        company.address.should be_valid
     end
     
     it "should fail with not address" do
        company = Company.new
        company.should have_at_least(1).error_on(:address)
     end     
  end
  
  # describe "with account" do
  #      it "should have an address" do
  #         company = Company.new
  #         company.errors_on(:account).should include("account missing")
  #      end
  #   end
end
