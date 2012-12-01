# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :employee do
    last_name "lastname"
    first_name "firstname"
    day_price "9.99"
    
    company
  end
end
