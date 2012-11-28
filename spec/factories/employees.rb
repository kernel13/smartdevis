# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :employee do
    last_name "MyString"
    first_name "MyString"
    day_price "9.99"
  end
end
