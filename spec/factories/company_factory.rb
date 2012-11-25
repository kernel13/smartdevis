FactoryGirl.define do
    factory :company do
        siret "11111111111111"
        name "company1"      
        
        address
        
        after(:build) do |company|
            account = build(:account, :company => company)
            company.accounts << account
        end
    end
        
    factory :company2, :class => :company do
       siret '22222222222222'
       name "company2"
       
       address 
       
       after(:build) do |company|
            account = build(:account2, :company => company)
            company.accounts << account
        end
    end
end