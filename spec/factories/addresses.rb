# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :address do
    address_line1 "800 route de sed"
    address_line2 "bat 3"
    city "vitrolles"
    postal_code 13568
    phone "0123654789"
    email "test@test.com"
  end
end
