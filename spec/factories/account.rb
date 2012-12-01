FactoryGirl.define do
    factory :account do
        email "stephane.sop@free.fr"
        password "ciotat13"
        password_confirmation "ciotat13"
    end
    
    factory :account2, :parent => :account do
        email "account2@example.fr"
        password "Password"
        password_confirmation "Password"   
    end
end